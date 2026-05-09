// daftar_murid_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaftarMuridController extends GetxController {
  final searchC = TextEditingController();

  RxList<Map<String, dynamic>> muridList = <Map<String, dynamic>>[
    {
      "nama": "Soleh",
      "telepon": "0897 6383 123",
      "email": "soleh@gmail.com",
      "tanggal": "19 Mei 2025",
      "jam": "09.00 WIB",
      "pengrajin": "Pak Tono",
      "lokasi": "Balaidesa Dukuhsembung",
      "harga": "Rp20.000",
    },

    {
      "nama": "Budi Santoso",
      "telepon": "0812 3456 7890",
      "email": "budi.santoso@gmail.com",
      "tanggal": "20 Mei 2025",
      "jam": "13.00 WIB",
      "pengrajin": "Pak Tono",
      "lokasi": "Balaidesa Dukuhsembung",
      "harga": "Rp20.000",
    },

    {
      "nama": "Siti Nurhaliza",
      "telepon": "0857 1122 3344",
      "email": "siti.nurhaliza@gmail.com",
      "tanggal": "21 Mei 2025",
      "jam": "09.00 WIB",
      "pengrajin": "Pak Tono",
      "lokasi": "Balaidesa Dukuhsembung",
      "harga": "Rp20.000",
    },
  ].obs;

  @override
  void onClose() {
    searchC.dispose();

    super.onClose();
  }
}
