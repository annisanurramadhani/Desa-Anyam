import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import 'jadwal_saya_controller.dart';

class JadwalSayaView extends GetView<JadwalSayaController> {
  const JadwalSayaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF6B4F3B),
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
                      'Jadwal Saya',
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

            const SizedBox(height: 16),

            const Text(
              "Jadwal Kelas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            const Text(
              "Berikut adalah jadwal kelas yang sudah Anda daftarkan.",
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 16),

            /// INFO BOX
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF2ECE6),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info, color: Color(0xFF6B4F3B)),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Status pembayaran akan dikonfirmasi oleh pengrajin setelah Anda membayar saat kelas berlangsung.",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// LIST DATA
            Obx(() {
              if (controller.jadwalList.isEmpty) {
                return const Center(child: Text("Belum ada jadwal"));
              }

              return Column(
                children: controller.jadwalList.map((item) {
                  return JadwalCard(item: item);
                }).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class JadwalCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const JadwalCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final String status = item["status"]?.toString() ?? "Belum Lunas";
    final bool isLunas = status == "Lunas";

    final Color statusColor = isLunas ? Colors.green : const Color(0xFFB57F50);

    return InkWell(
      borderRadius: BorderRadius.circular(20),

      /// ✅ FIX NAVIGASI DI SINI
      onTap: () {
        Get.toNamed(
          Routes.DETAIL_JADWAL, // ✅ SUDAH BENAR
          arguments: item,
        );
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF2ECE6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            /// HEADER
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Color(0xFF6B4F3B)),
                const SizedBox(width: 10),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pengrajin Anyaman Bambu",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Bersama Pak Tarjo", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 11,
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const Divider(height: 20),

            infoRow(Icons.calendar_today, "Tanggal", item["tanggal"]),
            infoRow(Icons.access_time, "Jam", item["jam"]),
            infoRow(Icons.location_on, "Lokasi", item["lokasi"]),
            infoRow(Icons.sell, "Harga", "Rp ${item["harga"] ?? 0} / sesi"),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 10,
                      color: isLunas ? Colors.green : Colors.brown,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isLunas ? "Selesai" : "Berlangsung",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),

                const Row(
                  children: [
                    Text("Lihat Detail"),
                    SizedBox(width: 4),
                    Icon(Icons.chevron_right, size: 16),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget infoRow(IconData icon, String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF6B4F3B)),
          const SizedBox(width: 10),
          Text("$title : "),
          Expanded(child: Text(value?.toString() ?? "-")),
        ],
      ),
    );
  }
}
