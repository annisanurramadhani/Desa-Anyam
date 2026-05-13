import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pendaftaran_berhasil_controller.dart';

class PendaftaranBerhasilView extends GetView<PendaftaranBerhasilController> {
  const PendaftaranBerhasilView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF6B4F3B),
        unselectedItemColor: Colors.grey,
        onTap: controller.changeMenu,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Jadwal Saya'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [

            /// HEADER
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
                        fontSize: 20,
                        color: Color(0xFF4E342E),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),

            const SizedBox(height: 20),

            /// SUCCESS ICON (INI BOLEH TETAP ADA BIAR UX BAGUS)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                size: 80,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Pendaftaran Berhasil!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Terima kasih, pendaftaran kelas Anda telah berhasil.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 20),

            /// DETAIL
            detailCard(),

            const SizedBox(height: 16),

            /// INFO
            infoPembayaran(),

            const SizedBox(height: 20),

            /// BUTTON
            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: controller.keHome,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9B6B43),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Kembali ke Beranda",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔥 DETAIL CARD (NO ICON + CENTER TITLE)
  Widget detailCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2ECE6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [

          /// TITLE CENTER
          const Center(
            child: Text(
              "Detail Pendaftaran",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),

          const SizedBox(height: 14),

          detailItem("Nama Lengkap", "Syifa Hadju"),
          detailItem("No. WhatsApp", "08123456789"),
          detailItem("Tanggal", "06 April 2026"),
          detailItem("Jam", "09:00"),
          detailItem("Lokasi", "Balaidesa Dukuhsembung"),
          detailItem("Pelatih", "Pak Tarjo"),
          detailItem("Kelas", "Anyaman Bambu"),
          detailItem("Harga", "Rp 50.000 / sesi"),
        ],
      ),
    );
  }

  /// 🔥 ITEM TANPA ICON
  Widget detailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  /// 🔥 INFO PEMBAYARAN (NO ICON)
  Widget infoPembayaran() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Text(
        "Pembayaran dilakukan secara tunai langsung kepada pelatih saat kelas berlangsung.",
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}