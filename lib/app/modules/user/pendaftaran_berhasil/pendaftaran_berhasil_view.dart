import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pendaftaran_berhasil_controller.dart';

class PendaftaranBerhasilView extends GetView<PendaftaranBerhasilController> {
  const PendaftaranBerhasilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4), // 🔥 sama kayak halaman lain

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: controller.changeMenu,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              /// 🔥 HEADER
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Pendaftaran Berhasil",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),

              const Spacer(),

              /// 🔥 ICON SUCCESS
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 80,
                ),
              ),

              const SizedBox(height: 20),

              /// 🔥 TITLE
              const Text(
                "Pendaftaran Berhasil!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 10),

              /// 🔥 DESC
              const Text(
                "Terimakasih telah mendaftar kelas\npelatihan anyaman.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),

              const Spacer(),

              /// 🔥 BUTTON DETAIL (CONSISTENT)
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: controller.keDetailPesanan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9B6B43),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Lihat Detail Pesanan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// 🔥 BACK HOME
              GestureDetector(
                onTap: controller.keHome,
                child: const Text(
                  "Kembali Ke Beranda",
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}