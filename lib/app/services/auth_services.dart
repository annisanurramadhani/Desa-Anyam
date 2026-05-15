import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // FLUTTER CHROME
  static const String chromeUrl = "http://127.0.0.1:5000/api";

  // HP ASLI
  static const String mobileUrl = "http://192.168.110.69:5000/api";

  // PILIH YANG DIPAKAI
  static const String baseUrl = chromeUrl;

  //   static const String baseUrl =
  //     mobileUrl;

  // ======================
  // LOGIN
  // ======================

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),

        headers: {'Content-Type': 'application/json'},

        body: jsonEncode({'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {"success": true, "data": data};
      } else {
        return {"success": false, "message": data["message"]};
      }
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }

  // ======================
  // REGISTER
  // ======================

  static Future<Map<String, dynamic>> register({
    required String nama,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),

        headers: {'Content-Type': 'application/json'},

        body: jsonEncode({'nama': nama, 'email': email, 'password': password}),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return {"success": true, "data": data};
      } else {
        return {"success": false, "message": data["message"]};
      }
    } catch (e) {
      return {"success": false, "message": e.toString()};
    }
  }
}
