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
        email: emailC.text,
        password: passwordC.text,
      );

      debugPrint(response.toString());

      // LOGIN BERHASIL
      if (response['success'] == true) {
        final data = response['data'];

        Get.snackbar("Sukses", data['message']);

        String role = data['user']['role'];

        // ROLE PENGRAJIN
        if (role == 'pengrajin') {
          Get.offAllNamed('/home-pengrajin');
        }
        // ROLE PENGGUNA
        else if (role == 'pengguna') {
          Get.offAllNamed('/home');
        }
        // ROLE TIDAK ADA
        else {
          Get.snackbar("Error", "Role tidak dikenali");
        }
      }
      // LOGIN GAGAL
      else {
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

  void loginGoogle() {}
}
