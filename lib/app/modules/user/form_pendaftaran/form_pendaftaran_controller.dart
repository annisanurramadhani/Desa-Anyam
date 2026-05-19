import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class FormPendaftaranController extends GetxController {

  late Map<String, dynamic> data;

  var nama = "".obs;
  var wa = "".obs;
  var email = "".obs;
  var tanggal = "".obs;
  var jam = "".obs;
  var pelatih = "".obs;
  var lokasi = "".obs;
  var harga = 0.obs;

  @override
  void onInit() {
    super.onInit();

    /// 🔥 FIX ERROR DI SINI
    data = Map<String, dynamic>.from(Get.arguments ?? {});

    nama.value = data["nama"]?.toString() ?? "";
    wa.value = data["wa"]?.toString() ?? "";
    email.value = data["email"]?.toString() ?? "";
    tanggal.value = data["tanggal"]?.toString() ?? "";
    jam.value = data["jam"]?.toString() ?? "";
    pelatih.value = data["pengrajin"]?.toString() ?? "";
    lokasi.value = data["lokasi"]?.toString() ?? "";
    harga.value = int.tryParse(data["harga"]?.toString() ?? "0") ?? 0;
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

  void goToPembayaran() {
    Get.toNamed('/pembayaran', arguments: data);
  }
}