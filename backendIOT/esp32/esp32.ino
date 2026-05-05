#include "esp_bt.h"
#include <HTTPClient.h>
#include <TinyGPS++.h>
#include <WiFi.h>


// ================= WIFI =================
const char *ssid = "Employees";
const char *password = "###HorizonU";

// ================= GPS =================
TinyGPSPlus gps;
HardwareSerial gpsSerial(2);

/*
 * ================= WIRING DIAGRAM =================
 * 
 * 1. PUSH BUTTON (Tombol Darurat)
 *    - Kaki 1 tombol  -> PIN 4
 *    - Kaki 2 tombol  -> GND
 *    (Tidak perlu resistor tambahan karena software memakai INPUT_PULLUP)
 *    
 * 2. BUZZER (Speaker Alarm)
 *    - Pin Positif (+) -> PIN 25
 *    - Pin Negatif (-) -> GND
 *    
 * 3. SOUND SENSOR (Sensor Kebisingan Suara / Analog)
 *    - Pin AO / Out    -> PIN 34
 *    - Pin VCC         -> 3.3V
 *    - Pin GND         -> GND
 *    
 * 4. MODUL GPS (contoh: Ublox Neo 6M)
 *    - Pin TX GPS      -> PIN 16 (Menuju RX2 ESP32)
 *    - Pin RX GPS      -> PIN 17 (Menuju TX2 ESP32)
 *    - Pin VCC         -> 3.3V atau 5V (Tergantung spesifikasi modul)
 *    - Pin GND         -> GND
 *    
 * 5. LED STATUS
 *    - Terhubung otomatis ke LED On-Board ESP32 (PIN 2)
 * ==================================================
 */

// ================= PIN =================
#define BUTTON_PIN 4
#define BUZZER_PIN 25
#define SOUND_PIN 34
#define LED_PIN 2

// ================= CONFIG =================
int noiseThreshold = 2000;
unsigned long lastSend = 0;
int sendInterval = 10000;

// ================= DEVICE INFO =================
String device_id = "1"; // Ganti dengan ID device yang terdaftar di database
String user_id = "1";   // Ganti dengan ID user yang terdaftar di database

// ================= STATE =================
bool wifiConnected = false;
volatile bool emergencyTriggered = false;

// ================= ISR (INTERRUPT) =================
// Fungsi ini dipanggil secara otomatis HANYA detik itu spesifik tombol ditekan
void IRAM_ATTR buttonInterrupt() {
  emergencyTriggered = true;
}

// ================= SETUP =================
void setup() {
  Serial.begin(115200);

  // Matikan Bluetooth (biar ringan)
  btStop();

  // PIN MODE
  pinMode(BUTTON_PIN, INPUT_PULLUP);
  pinMode(BUZZER_PIN, OUTPUT);
  pinMode(LED_PIN, OUTPUT);

  // Buat tombol jadi prioritas (Interrupt)
  attachInterrupt(digitalPinToInterrupt(BUTTON_PIN), buttonInterrupt, FALLING);

  // GPS
  gpsSerial.setRxBufferSize(1024);
  gpsSerial.begin(9600, SERIAL_8N1, 16, 17);

  // WIFI
  connectWiFi();
}

// ================= SMART DELAY =================
static void smartDelay(unsigned long ms) {
  unsigned long start = millis();
  do {
    while (gpsSerial.available()) {
      gps.encode(gpsSerial.read());
    }
    delay(10); // sedikit jeda
  } while (millis() - start < ms);
}

// ================= LOOP =================
void loop() {

  // ===== WIFI CHECK =====
  checkWiFi();

  // ===== LED STATUS =====
  ledStatus();

  // ===== GPS READ =====
  while (gpsSerial.available()) {
    gps.encode(gpsSerial.read());
  }

  // ===== GPS DEBUG =====
  Serial.print("GPS Stats: Sats=");
  Serial.print(gps.satellites.value());
  Serial.print(", Chars=");
  Serial.print(gps.charsProcessed());
  Serial.print(", Valid=");
  Serial.println(gps.location.isValid() ? "YES" : "NO");

  // Gunakan double agar presisi desimal tidak hilang
  double lat = -999;
  double lng = -999;

  if (gps.location.isValid()) {
    lat = gps.location.lat();
    lng = gps.location.lng();
  }

  // ===== SOUND READ =====
  int soundValue = analogRead(SOUND_PIN);

  Serial.print("Sound: ");
  Serial.println(soundValue);

  // ===== CLASSIFICATION =====
  String level;
  if (soundValue < 1500)
    level = "SUNYI";
  else if (soundValue < 2500)
    level = "SEDANG";
  else
    level = "BISING";

  // ===== EMERGENCY BUTTON =====
  if (emergencyTriggered) {
    emergencyTriggered = false; // Reset status

    Serial.println("🚨 EMERGENCY BUTTON PRESSED!");
    // KIRIM KE DATABASE TERLEBIH DAHULU (LANGSUNG)
    sendLocation(lat, lng, "EMERGENCY", soundValue, level,
                 "Anak anda perlu bantuan, segera datangi ke lokasi");

    // Baru bunyikan alarm
    alarmEmergency();
    smartDelay(3000);
  }

  // ===== NOISE DETECTION =====
  if (soundValue > noiseThreshold) {
    Serial.println("🔊 NOISE DETECTED!");
    // KIRIM KE DATABASE TERLEBIH DAHULU (LANGSUNG)
    sendLocation(lat, lng, "NOISE", soundValue, level, "");

    // Baru bunyikan alarm
    alarmNoise();
    smartDelay(2000);
  }

  // ===== AUTO SEND =====
  if (millis() - lastSend > sendInterval) {
    sendLocation(lat, lng, "NORMAL", soundValue, level, "");
    lastSend = millis();
  }

  smartDelay(200);
}

// ================= WIFI CONNECT =================
void connectWiFi() {
  Serial.print("Connecting WiFi");

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    blinkFast();
  }

  Serial.println("\n✅ WiFi Connected");
  wifiConnected = true;
}

// ================= WIFI CHECK =================
void checkWiFi() {
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("⚠️ WiFi Lost!");
    wifiConnected = false;
    connectWiFi();
  } else {
    wifiConnected = true;
  }
}

// ================= LED =================
void ledStatus() {
  if (wifiConnected) {
    digitalWrite(LED_PIN, HIGH); // nyala stabil
  } else {
    blinkSlow();
  }
}

void blinkFast() {
  digitalWrite(LED_PIN, HIGH);
  delay(150);
  digitalWrite(LED_PIN, LOW);
  delay(150);
}

void blinkSlow() {
  digitalWrite(LED_PIN, HIGH);
  delay(500);
  digitalWrite(LED_PIN, LOW);
  delay(500);
}

// ================= BUZZER =================
void alarmNoise() {
  for (int i = 0; i < 3; i++) {
    tone(BUZZER_PIN, 1500);
    smartDelay(150);
    noTone(BUZZER_PIN);
    smartDelay(150);
  }
}

void alarmEmergency() {
  for (int i = 0; i < 6; i++) {
    tone(BUZZER_PIN, 1000);
    smartDelay(200);
    noTone(BUZZER_PIN);
    smartDelay(200);
  }
}

// ================= URL ENCODE =================
String urlEncode(String str) {
  String encodedString = "";
  char c;
  char code0;
  char code1;
  for (int i = 0; i < str.length(); i++) {
    c = str.charAt(i);
    if (c == ' ') {
      encodedString += '+';
    } else if (isalnum(c)) {
      encodedString += c;
    } else {
      code1 = (c & 0xf) + '0';
      if ((c & 0xf) > 9) {
        code1 = (c & 0xf) - 10 + 'A';
      }
      c = (c >> 4) & 0xf;
      code0 = c + '0';
      if (c > 9) {
        code0 = c - 10 + 'A';
      }
      encodedString += '%';
      encodedString += code0;
      encodedString += code1;
    }
  }
  return encodedString;
}

// ================= SEND DATA =================
void sendLocation(double lat, double lng, String status, int noiseValue,
                  String level, String message) {

  if (WiFi.status() == WL_CONNECTED) {

    HTTPClient http;

    String url = "http://10.61.4.155/backendIOT/send.php?";
    url += "device_id=" + device_id;
    url += "&user_id=" + user_id;

    // Hanya kirim lat/lng jika valid (bukan -999)
    if (lat != -999 && lng != -999) {
      url +=
          "&lat=" + String(lat, 8); // Kirim 8 desimal untuk tipe data DECIMAL
      url += "&lng=" + String(lng, 8);
    }

    url += "&status=" + status;
    url += "&noise=" + String(noiseValue);
    url += "&level=" + level;

    if (message != "") {
      url += "&message=" + urlEncode(message);
    }

    Serial.println("Sending Request: " + url);

    http.begin(url);
    int httpCode = http.GET();

    Serial.print("HTTP Response Code: ");
    Serial.println(httpCode);

    if (httpCode > 0) {
      String payload = http.getString();
      Serial.println("Server Response: " + payload);
    } else {
      Serial.println("Error on HTTP Request: " + http.errorToString(httpCode));
    }

    http.end();
  } else {
    Serial.println("❌ WiFi not connected");
  }
}