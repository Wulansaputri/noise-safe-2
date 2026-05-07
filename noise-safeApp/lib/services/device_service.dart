import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/api_constants.dart';

// 
class DeviceService {

  // ================= CONNECT DEVICE =================
  static Future<Map<String, dynamic>> connectDevice({
    required String serialNumber,
    required String ownerName,
  }) async {

    final url = Uri.parse("${ApiConstants.baseUrl}/device/connect");

    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    if (token == null) {
      throw Exception("Token tidak ditemukan");
    }

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "serial_number": serialNumber,
        "owner_name": ownerName,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data["message"]);
    }
  }

  // ================= GET DEVICES =================
    static Future<List<dynamic>> getDevices() async {

    final url = Uri.parse("${ApiConstants.baseUrl}/devices");

    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    final response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    print("GET DEVICES STATUS: ${response.statusCode}");
    print("GET DEVICES BODY: ${response.body}");

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data['devices'];
    } else {
      throw Exception(data["message"] ?? "Gagal ambil device");
    }
  }
}