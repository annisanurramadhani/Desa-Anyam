// login_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  RxBool isHidden = true.obs;

  void togglePassword() {
    isHidden.value = !isHidden.value;
  }

  void login() {
    Get.offAllNamed('/home');
  }

  void goToRegister() {
    Get.toNamed('/register');
  }

  void loginGoogle() {
    // login google
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}