import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/api_constants.dart';

class DeviceService {

  static Future<Map<String, dynamic>> connectDevice({
    required String serialNumber,
    required String ownerName,
  }) async {

    final url = Uri.parse("${ApiConstants.baseUrl}/device/connect");
    
    // Ambil token dari SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('auth_token');

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

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return data;
    } else {
      throw Exception(data["message"] ?? "Gagal menghubungkan device");
    }
  }
}