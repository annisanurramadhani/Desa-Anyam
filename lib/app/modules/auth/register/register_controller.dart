import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth_services.dart';

class RegisterController extends GetxController {
  final usernameC = TextEditingController();

  final emailC = TextEditingController();

  final passwordC = TextEditingController();

  RxBool isHidden = true.obs;

  RxBool isLoading = false.obs;

  void togglePassword() {
    isHidden.value = !isHidden.value;
  }

  Future<void> register() async {
    if (usernameC.text.isEmpty ||
        emailC.text.isEmpty ||
        passwordC.text.isEmpty) {
      Get.snackbar("Error", "Semua field wajib diisi");

      return;
    }

    try {
      isLoading.value = true;

      final response = await AuthService.register(
        username: usernameC.text.trim(),

        email: emailC.text.trim(),

        password: passwordC.text.trim(),
      );

      debugPrint(response.toString());

      if (response['success'] == true) {
        Get.snackbar("Sukses", response['message']);

        Get.offAllNamed('/login');
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

  void goToLogin() {
    Get.back();
  }
}
