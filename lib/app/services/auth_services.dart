import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // =========================
  // BASE URL
  // =========================
  static String get baseUrl {
    // CHROME / WEB
    if (kIsWeb) {
      return "http://localhost:3000";
    }

    // ANDROID EMULATOR
    return "http://192.168.110.207:3000";
  }

  // =========================
  // LOGIN
  // =========================
  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/api/auth/login"),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode({"email": email, "password": password}),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // =========================
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
        Uri.parse("$baseUrl/api/auth/register"),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode({
          "username": username,

          "email": email,

          "password": password,

          "role": "pengguna",
        }),
      );

      debugPrint(response.body);

      return jsonDecode(response.body);
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }
}
