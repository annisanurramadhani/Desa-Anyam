// edit_profile_pengrajin_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePengrajinController extends GetxController {
  final namaC = TextEditingController(text: 'Pak Tono');

  final emailC = TextEditingController(text: 'tono@gmail.com');

  final teleponC = TextEditingController(text: '08976383');

  final pengalamanC = TextEditingController(text: '8 Tahun');

  final deskripsiC = TextEditingController(text: 'Pengrajin Anyaman');

  void simpanProfile() {
    Get.snackbar(
      'Berhasil',
      'Profil berhasil diperbarui',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    namaC.dispose();

    emailC.dispose();

    teleponC.dispose();

    pengalamanC.dispose();

    deskripsiC.dispose();

    super.onClose();
  }
}
