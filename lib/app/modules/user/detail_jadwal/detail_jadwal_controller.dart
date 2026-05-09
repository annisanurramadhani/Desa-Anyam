import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class DetailJadwalController extends GetxController {
  late Map<String, dynamic> data;

  var rating = 0.obs;
  final reviewC = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    /// 🔥 FIX DI SINI
    data = Map<String, dynamic>.from(Get.arguments ?? {});
  }

  void changeMenu(int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.JADWAL_SAYA);
        break;
      case 1:
        Get.offAllNamed(Routes.HOME);
        break;
      case 2:
        Get.toNamed(Routes.PROFILE_USER);
        break;
    }
  }

  void setRating(int value) {
    rating.value = value;
  }

  void kirimReview() {
    if (rating.value == 0) {
      Get.snackbar("Error", "Pilih rating dulu");
      return;
    }

    if (reviewC.text.isEmpty) {
      Get.snackbar("Error", "Isi ulasan dulu");
      return;
    }

    Get.snackbar("Berhasil", "Review berhasil dikirim");

    rating.value = 0;
    reviewC.clear();
  }
}