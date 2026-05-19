import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/api_constants.dart';

class AuthService {

  // ================= REGISTER =================
  static Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    String? avatar, // avatar jadi optional
  }) async {

    final url = Uri.parse("${ApiConstants.baseUrl}/register");
    print("FINAL URL: $url");

    final Map<String, dynamic> requestBody = {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    };
    
    // tambah avatar jika ada
    if (avatar != null) {
      requestBody["avatar"] = avatar;
    }

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(requestBody),
    );

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    final data = response.body.isNotEmpty
        ? jsonDecode(response.body)
        : {};

    if (response.statusCode == 200 ||
        response.statusCode == 201) {
      return data;
    } else {
      throw Exception(
        data["message"] ??
        "Register gagal (${response.statusCode})"
      );
    }
  }

  // ================= LOGIN =================
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {

    final url = Uri.parse("${ApiConstants.baseUrl}/login");

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      final data = response.body.isNotEmpty
          ? jsonDecode(response.body)
          : {};

      if (response.statusCode == 200) {
        // simpan avatar dari response jika ada
        final prefs = await SharedPreferences.getInstance();
        if (data['user'] != null && data['user']['avatar'] != null) {
          await prefs.setString('user_avatar', data['user']['avatar']);
        }
        return data;
      } else {
        throw Exception(
          data["message"] ??
          "Login gagal (${response.statusCode})"
        );
      }

    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // ================= LOGOUT =================
  static Future<void> logout() async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final url = Uri.parse("${ApiConstants.baseUrl}/logout");

    await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    // hapus local data
    await prefs.remove('token');
    await prefs.remove('user_id');
    await prefs.remove('name');
    await prefs.remove('user_avatar'); // hapus juga avatar
  }
}