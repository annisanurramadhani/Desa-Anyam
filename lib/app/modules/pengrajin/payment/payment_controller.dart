// payment_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final searchC = TextEditingController();

  RxList<Map<String, dynamic>> paymentList = <Map<String, dynamic>>[
    {
      "nama": "Soleh",
      "tanggal": "19 Mei 2025",
      "metode": "Cash",
      "status": "Lunas",
      "harga": "Rp50.000",
    },

    {
      "nama": "Budi",
      "tanggal": "20 Mei 2025",
      "metode": "Cash",
      "status": "Belum Bayar",
      "harga": "Rp50.000",
    },

    {
      "nama": "Siti",
      "tanggal": "21 Mei 2025",
      "metode": "Cash",
      "status": "Lunas",
      "harga": "Rp50.000",
    },
  ].obs;

  @override
  void onClose() {
    searchC.dispose();

    super.onClose();
  }
}
