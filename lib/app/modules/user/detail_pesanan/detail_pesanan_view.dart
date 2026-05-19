import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_pesanan_controller.dart';

class DetailPesananView extends GetView<DetailPesananController> {
  const DetailPesananView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.data;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF9B6B43),
        unselectedItemColor: Colors.grey,
        onTap: controller.changeMenu,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Jadwal Saya'),
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
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
                      "Detail Jadwal",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9B6B43),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),

            const SizedBox(height: 20),

            /// 🔥 INFORMASI KELAS
            sectionCard(
              title: "Informasi Kelas",
              icon: Icons.calendar_today,
              child: Column(
                children: [
                  infoRow("Kelas", data["kelas"]),
                  infoRow("Pengrajin", data["pengrajin"]),
                  infoRow("Tanggal", data["tanggal"]),
                  infoRow("Jam", data["jam"]),
                  infoRow("Lokasi", data["lokasi"]),
                  infoRow("Harga", "Rp ${data["harga"]} / sesi"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// 🔥 STATUS
            sectionCard(
              title: "Status",
              icon: Icons.info,
              child: Column(
                children: [
                  statusRow("Pembayaran", data["statusBayar"] ?? "Belum Lunas"),
                  const Divider(),
                  statusRow("Kelas", data["statusKelas"] ?? "Akan Datang"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// 🔥 TENTANG
            sectionCard(
              title: "Tentang Kelas",
              icon: Icons.description,
              child: const Text(
                "Kelas praktik langsung membuat berbagai kerajinan anyaman bambu bersama pengrajin berpengalaman.",
                style: TextStyle(fontSize: 13),
              ),
            ),

            const SizedBox(height: 16),

            /// 🔥 REVIEW
            sectionCard(
              title: "Berikan Review",
              icon: Icons.star,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Bagikan pengalaman Anda setelah mengikuti kelas ini.",
                    style: TextStyle(fontSize: 13),
                  ),

                  const SizedBox(height: 14),

                  const Text("Rating"),

                  const SizedBox(height: 8),

                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(Icons.star_border,
                          color: Color(0xFF9B6B43)),
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text("Ulasan Anda"),

                  const SizedBox(height: 8),

                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: const TextField(
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: "Tulis ulasan Anda di sini...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "0/300",
                      style: TextStyle(fontSize: 11),
                    ),
                  ),

                  const SizedBox(height: 14),

                  /// 🔥 BUTTON KIRIM
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: controller.kirimReview,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9B6B43),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Kirim Review",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "* Review dapat diberikan setelah kelas selesai.",
                    style: TextStyle(fontSize: 11, color: Colors.black54),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔥 CARD SECTION
  Widget sectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2ECE6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              Icon(icon, color: const Color(0xFF9B6B43)),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          child
        ],
      ),
    );
  }

  /// 🔥 INFO ROW
  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          const Text(": "),
          Expanded(flex: 2, child: Text(value)),
        ],
      ),
    );
  }

  /// 🔥 STATUS ROW
  Widget statusRow(String title, String value) {
    return Row(
      children: [
        Expanded(child: Text(title)),
        const Text(": "),
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6D6C3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9B6B43),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}