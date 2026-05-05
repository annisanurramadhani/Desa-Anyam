// register_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final confirmPasswordC = TextEditingController();

  RxBool isHiddenPassword = true.obs;
  RxBool isHiddenConfirm = true.obs;

  void togglePassword() {
    isHiddenPassword.value = !isHiddenPassword.value;
  }

  void toggleConfirmPassword() {
    isHiddenConfirm.value = !isHiddenConfirm.value;
  }

  void register() {
    Get.offAllNamed('/home');
  }

  @override
  void onClose() {
    nameC.dispose();
    emailC.dispose();
    passwordC.dispose();
    confirmPasswordC.dispose();
    super.onClose();
  }
}