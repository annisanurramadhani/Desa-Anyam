import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_jadwal_controller.dart';

class DetailJadwalView extends GetView<DetailJadwalController> {
  const DetailJadwalView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.data ?? {};
    final bool isSelesai = data["status"] == "Lunas";

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF9B6B43),
        unselectedItemColor: Colors.grey,
        onTap: controller.changeMenu,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Jadwal Saya',
          ),
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
                      'Detail Jadwal',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4E342E),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),

            const SizedBox(height: 20),

            /// INFORMASI KELAS
            cardSection(
              icon: Icons.calendar_today,
              title: "Informasi Kelas",
              child: Column(
                children: [
                  infoRow("Kelas", data["kelas"] ?? "Pengrajin Anyaman Bambu"),
                  infoRow("Pengrajin", data["pengrajin"] ?? "Pak Tarjo"),
                  infoRow("Tanggal", data["tanggal"] ?? "-"),
                  infoRow("Jam", data["jam"] ?? "-"),
                  infoRow("Lokasi", data["lokasi"] ?? "-"),
                  infoRow("Harga", "Rp ${data["harga"] ?? 0} / sesi"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// STATUS
            cardSection(
              icon: Icons.info,
              title: "Status",
              child: Column(
                children: [
                  statusRow("Pembayaran", data["status"]?.toString()),
                  const Divider(),
                  statusRow("Kelas", isSelesai ? "Selesai" : "Akan Datang"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// TENTANG
            cardSection(
              icon: Icons.description,
              title: "Tentang Kelas",
              child: Text(
                data["deskripsi"] ??
                    "Kelas praktik langsung membuat anyaman bambu bersama pengrajin berpengalaman.",
                style: const TextStyle(fontSize: 13),
              ),
            ),

            if (isSelesai) ...[
              const SizedBox(height: 16),

              cardSection(
                icon: Icons.star,
                title: "Berikan Review",
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

                    Obx(
                      () => Row(
                        children: List.generate(
                          5,
                          (index) => GestureDetector(
                            onTap: () => controller.setRating(index + 1),
                            child: Icon(
                              index < controller.rating.value
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),
                    const Text("Ulasan Anda"),
                    const SizedBox(height: 8),

                    TextField(
                      controller: controller.reviewC,
                      maxLength: 300,
                      maxLines: 4,
                      decoration: InputDecoration(
                        hintText: "Tulis ulasan Anda di sini...",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

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
                      "* Review hanya tersedia setelah kelas selesai.",
                      style: TextStyle(fontSize: 11, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// 🔥 CARD (SUDAH JADI PUTIH)
  Widget cardSection({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white, // ✅ INI YANG DIUBAH
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF6B4F3B)),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }

  Widget infoRow(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(title)),
          const Text(": "),
          Expanded(flex: 2, child: Text(value?.toString() ?? "-")),
        ],
      ),
    );
  }

  Widget statusRow(String title, String? value) {
    value = value ?? "-";

    Color color = value == "Lunas"
        ? Colors.green
        : value == "Belum Lunas"
            ? Colors.orange
            : Colors.brown;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
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
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 11,
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}