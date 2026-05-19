import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../routes/app_routes.dart';

class EditProfileController extends GetxController {

  var imageFile = Rx<File?>(null);
  final picker = ImagePicker();

  /// 🔥 TEXT CONTROLLER (WAJIB)
  final namaC = TextEditingController(text: "Syifa Hadju");
  final emailC = TextEditingController(text: "cobacoba@gmail.com");
  final telpC = TextEditingController(text: "0895123456");

  /// PICK IMAGE
  Future<void> pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      imageFile.value = File(picked.path);
    }
  }

  /// 🔥 NAVIGASI BOTTOM
  void changeMenu(int index) {
    if (index == 0) {
      Get.toNamed(Routes.JADWAL_SAYA);
    } else if (index == 1) {
      Get.offAllNamed(Routes.HOME);
    } else if (index == 2) {
      Get.toNamed(Routes.PROFILE_USER);
    }
  }

  /// SIMPAN
  void simpan() {
    Get.snackbar('Berhasil', 'Profil berhasil diperbarui');
    Get.back();
  }

  @override
  void onClose() {
    namaC.dispose();
    emailC.dispose();
    telpC.dispose();
    super.onClose();
  }
}