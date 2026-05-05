import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants/api_constants.dart';

class AuthService {

  // ================= REGISTER =================
  static Future<Map<String, dynamic>> register({
  required String name,
  required String email,
  required String password,
  required String phone,
}) async {

  final url = Uri.parse("${ApiConstants.baseUrl}/register");
  print("FINAL URL: $url");

  final response = await http.post(
    url,
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    },
    body: jsonEncode({
      "name": name,
      "email": email,
      "password": password,
      "phone": phone, // 🔥 FIX DI SINI
    }),
  );

  print("STATUS: ${response.statusCode}");
  print("BODY: ${response.body}");

  final data = response.body.isNotEmpty
      ? jsonDecode(response.body)
      : {};

  if (response.statusCode == 200) {
    return data;
  } else {
    throw Exception(data["message"] ?? "Register gagal (${response.statusCode})");
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
        return data;
      } else {
        throw Exception(data["message"] ?? "Login gagal (${response.statusCode})");
      }

    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}

