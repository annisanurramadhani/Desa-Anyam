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

            /// ICON SUCCESS
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

            /// 🔥 DETAIL PENDAFTARAN
            detailCard(),

            const SizedBox(height: 16),

            /// 🔥 INFO PEMBAYARAN
            infoPembayaran(),

            const SizedBox(height: 20),

            /// BUTTON
            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: controller.keHome,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B4F3B),
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

  /// 🔥 DETAIL CARD
  Widget detailCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2ECE6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [

          Row(
            children: const [
              Icon(Icons.description, color: Color(0xFF6B4F3B)),
              SizedBox(width: 10),
              Text(
                "Detail Pendaftaran",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 14),

          detailItem(Icons.person, "Nama Lengkap", "Syifa Hadju"),
          detailItem(Icons.chat, "No. WhatsApp", "08123456789"),
          detailItem(Icons.calendar_today, "Tanggal", "06 April 2026"),
          detailItem(Icons.access_time, "Jam", "09:00"),
          detailItem(Icons.location_on, "Lokasi", "Balaidesa Dukuhsembung"),
          detailItem(Icons.person_outline, "Pelatih", "Pak Tarjo"),
          detailItem(Icons.category, "Kelas", "Anyaman Bambu"),
          detailItem(Icons.sell, "Harga", "Rp 50.000 / sesi"),
        ],
      ),
    );
  }

  /// 🔥 ITEM DETAIL
  Widget detailItem(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF6B4F3B)),
          const SizedBox(width: 10),
          Expanded(child: Text(title)),
          Text(value),
        ],
      ),
    );
  }

  /// 🔥 INFO PEMBAYARAN
  Widget infoPembayaran() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          Icon(Icons.info, color: Colors.green),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Pembayaran dilakukan secara tunai langsung kepada pelatih saat kelas berlangsung.",
              style: TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}