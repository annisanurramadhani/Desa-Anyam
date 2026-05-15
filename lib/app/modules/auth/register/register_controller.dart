import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth_services.dart';

class RegisterController extends GetxController {
  final nameC = TextEditingController();

  final emailC = TextEditingController();

  final passwordC = TextEditingController();

  final confirmPasswordC = TextEditingController();

  RxBool isHiddenPassword = true.obs;

  RxBool isHiddenConfirm = true.obs;

  RxBool isLoading = false.obs;

  void togglePassword() {
    isHiddenPassword.value = !isHiddenPassword.value;
  }

  void toggleConfirmPassword() {
    isHiddenConfirm.value = !isHiddenConfirm.value;
  }

  Future<void> register() async {
    // VALIDASI KOSONG
    if (nameC.text.isEmpty ||
        emailC.text.isEmpty ||
        passwordC.text.isEmpty ||
        confirmPasswordC.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Semua field wajib diisi',

        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      return;
    }

    // VALIDASI PASSWORD
    if (passwordC.text != confirmPasswordC.text) {
      Get.snackbar(
        'Error',
        'Konfirmasi password tidak sama',

        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      return;
    }

    try {
      isLoading.value = true;

      final response = await AuthService.register(
        nama: nameC.text.trim(),

        email: emailC.text.trim(),

        password: passwordC.text.trim(),
      );

      // REGISTER BERHASIL
      if (response['success'] == true) {
        final data = response['data'];

        Get.snackbar(
          'Berhasil',
          data['message'],

          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Future.delayed(const Duration(milliseconds: 500), () {
          Get.offAllNamed('/login');
        });
      }
      // REGISTER GAGAL
      else {
        Get.snackbar(
          'Error',
          response['message'],

          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      debugPrint(e.toString());

      Get.snackbar(
        'Error',
        'Tidak dapat terhubung ke server',

        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
