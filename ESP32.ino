#include <WiFi.h>
#include <HTTPClient.h>
#include <HardwareSerial.h>
#include <TinyGPS++.h>

// ================== KONFIGURASI WIFI & SERVER ==================
const char* ssid = "NAMA_WIFI_ANDA";         // Ganti dengan nama WiFi Anda
const char* password = "PASSWORD_WIFI_ANDA"; // Ganti dengan password WiFi

// Ganti IP dengan IP Local Laptop Anda (IPv4 di jaringan WiFi).
// Contoh jika Laragon jalan di port 80: "http://192.168.1.15/api/noise-reports"
// Pastikan firewall PC mengizinkan koneksi masuk.
const char* serverName = "http://192.168.x.x/api/noise-reports"; 

// ======================= DEFINISI PIN ==========================
const int MAX9814_PIN = 34;    
const int BUTTON_PIN  = 4;     
const int SPEAKER_PIN = 25;    

HardwareSerial gpsSerial(2); // RX2 = 16, TX2 = 17
TinyGPSPlus gps;

void setup() {
  Serial.begin(115200);
  gpsSerial.begin(9600, SERIAL_8N1, 16, 17);
  
  pinMode(BUTTON_PIN, INPUT_PULLUP);
  pinMode(SPEAKER_PIN, OUTPUT);

  // Mulai koneksi WiFi
  Serial.print("\nMenghubungkan ke WiFi");
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("\nWiFi Terhubung!");
  Serial.print("IP Address: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  while (gpsSerial.available() > 0) {
    gps.encode(gpsSerial.read());
  }

  bool isButtonPressed = (digitalRead(BUTTON_PIN) == LOW);
  
  if (isButtonPressed) {
    int audioValue = analogRead(MAX9814_PIN);
    Serial.println("\n[TOMBOL DITEKAN] Mengirim data ke Laravel...");

    // Cek koneksi WiFi sebelum mengirim POST request
    if (WiFi.status() == WL_CONNECTED) {
      HTTPClient http;
      
      // Persiapkan Data HTTP HTTP
      http.begin(serverName);
      http.addHeader("Content-Type", "application/json"); // Kirim sebagai JSON

      // Ambil Koordinat (Default: 0.0 jika GPS belum mendapat sinyal)
      float latitude = 0.0;
      float longitude = 0.0;
      
      if (gps.location.isValid()) {
        latitude = gps.location.lat();
        longitude = gps.location.lng();
      } else {
        Serial.println("Warning: GPS belum valid. Mengirim koordinat 0.0");
      }

      // Buat Body Data JSON
      String jsonPayload = "{\"sound_level\":" + String(audioValue) + 
                           ",\"latitude\":" + String(latitude, 6) + 
                           ",\"longitude\":" + String(longitude, 6) + "}";
                           
      Serial.println("Payload: " + jsonPayload);

      // Kirim HTTP POST Request
      int httpResponseCode = http.POST(jsonPayload);

      if (httpResponseCode > 0) {
        Serial.print("Data Terkirim! HTTP Response code: ");
        Serial.println(httpResponseCode);
        bunyikanSpeaker(); // Bunyikan speaker jika sukses
      } else {
        Serial.print("Gagal mengirim data. Error code: ");
        Serial.println(httpResponseCode);
      }
      
      // Bebaskan resources
      http.end();
    } else {
      Serial.println("Error: Terputus dari WiFi");
    }

    delay(2000); // Jeda agar tidak ada pengiriman double
  }
}

void bunyikanSpeaker() {
  for(int i = 0; i < 100; i++) {
    digitalWrite(SPEAKER_PIN, HIGH);
    delayMicroseconds(1000); 
    digitalWrite(SPEAKER_PIN, LOW);
    delayMicroseconds(1000);
  }
}
