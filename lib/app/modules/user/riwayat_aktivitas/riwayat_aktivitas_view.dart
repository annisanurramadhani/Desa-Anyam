import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'riwayat_aktivitas_controller.dart';

class RiwayatAktivitasView extends GetView<RiwayatAktivitasController> {
  const RiwayatAktivitasView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 20),
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
                      'Riwayat Aktivitas',
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

            /// LIST RIWAYAT
            Obx(() {
              if (controller.riwayatList.isEmpty) {
                return const Center(child: Text("Belum ada riwayat"));
              }

              return Column(
                children: controller.riwayatList.map((item) {
                  return riwayatCard(item);
                }).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// 🔥 CARD RIWAYAT KELAS
  Widget riwayatCard(Map item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          /// HEADER
          Row(
            children: [
              const Icon(Icons.calendar_today, color: Color(0xFF6B4F3B)),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["kelas"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Bersama ${item["pengrajin"]}",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "Selesai",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const Divider(height: 20),

          /// DETAIL
          infoRow(Icons.calendar_today, "Tanggal", item["tanggal"]),
          infoRow(Icons.access_time, "Jam", item["jam"]),
          infoRow(Icons.location_on, "Lokasi", item["lokasi"]),
        ],
      ),
    );
  }

  Widget infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF9B6B43)),
          const SizedBox(width: 10),
          Text("$title : "),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
