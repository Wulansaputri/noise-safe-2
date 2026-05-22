import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/api_constants.dart';

class UserService {

  /*
  --------------------------------------------------
  GET PROFILE
  --------------------------------------------------
  */

  static Future<Map<String, dynamic>> getProfile() async {

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    final response = await http.get(
      Uri.parse("${ApiConstants.baseUrl}/profile"),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    print("PROFILE STATUS: ${response.statusCode}");
    print("PROFILE BODY: ${response.body}");

    return jsonDecode(response.body);
  }

  /*
  --------------------------------------------------
  UPDATE PROFILE
  --------------------------------------------------
  */

  static Future<Map<String, dynamic>> updateProfile({
    required String name,
    required String phone,
    required String avatar,
  }) async {

    final prefs =
        await SharedPreferences.getInstance();

    final token =
        prefs.getString('token');

    final response = await http.put(

      Uri.parse(
        "${ApiConstants.baseUrl}/update-profile",
      ),

      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },

      body: {
        "name": name,
        "phone": phone,
        "avatar": avatar,
      },
    );

    print("UPDATE PROFILE STATUS: ${response.statusCode}");
    print("UPDATE PROFILE BODY: ${response.body}");

    return jsonDecode(response.body);
  }
}