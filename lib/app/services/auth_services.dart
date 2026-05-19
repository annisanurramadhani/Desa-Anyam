import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  // EMULATOR ANDROID
  static const String baseUrl = "http://localhost:3000/api/auth";

  // HP ASLI
  // static const String baseUrl =
  //     "http://192.168.1.5:3000/api/auth";

  // =========================
  // LOGIN
  // =========================
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode({"email": email, "password": password}),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // =========================
  // REGISTER
  // =========================
  static Future<Map<String, dynamic>> register({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/register"),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode({
          "username": username,

          "email": email,

          "password": password,
        }),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }
}
