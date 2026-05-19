import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth_services.dart';

class LoginController extends GetxController {
  final emailC = TextEditingController();

  final passwordC = TextEditingController();

  RxBool isHidden = true.obs;

  RxBool isLoading = false.obs;

  void togglePassword() {
    isHidden.value = !isHidden.value;
  }

  Future<void> login() async {
    if (emailC.text.isEmpty || passwordC.text.isEmpty) {
      Get.snackbar("Error", "Email dan password wajib diisi");

      return;
    }

    try {
      isLoading.value = true;

      final response = await AuthService.login(
        email: emailC.text.trim(),

        password: passwordC.text.trim(),
      );

      debugPrint(response.toString());

      if (response['success'] == true) {
        Get.snackbar("Sukses", response['message']);

        String token = response['token'];

        final user = response['user'];

        String username = user['username'];

        String role = user['role'];

        debugPrint(token);

        debugPrint(username);

        debugPrint(role);

        if (role == 'admin') {
          Get.offAllNamed('/dashboard-admin');
        } else if (role == 'pengrajin') {
          Get.offAllNamed('/home-pengrajin');
        } else if (role == 'pengguna') {
          Get.offAllNamed('/home');
        } else {
          Get.snackbar("Error", "Role tidak dikenali");
        }
      } else {
        Get.snackbar("Error", response['message']);
      }
    } catch (e) {
      debugPrint(e.toString());

      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void goToRegister() {
    Get.toNamed('/register');
  }

  Future<void> loginGoogle() async {
    Get.snackbar("Info", "Login Google belum dibuat");
  }
}
