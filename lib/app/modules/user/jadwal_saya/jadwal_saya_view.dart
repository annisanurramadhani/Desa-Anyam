import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'jadwal_saya_controller.dart';

class JadwalSayaView extends GetView<JadwalSayaController> {
  const JadwalSayaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 16),

              /// LIST
              Expanded(
                child: Obx(() {
                  if (controller.jadwalList.isEmpty) {
                    return const Center(
                      child: Text("Belum ada jadwal"),
                    );
                  }

                  return ListView.builder(
                    itemCount: controller.jadwalList.length,
                    itemBuilder: (context, index) {
                      final item = controller.jadwalList[index];

                      return JadwalCard(
                        tanggal: item["tanggal"] ?? "-",
                        bulan: item["bulan"] ?? "-",
                        hari: item["hari"] ?? "-",
                        title: item["title"] ?? "-",
                        jam: item["jam"] ?? "-",
                        lokasi: item["lokasi"] ?? "-",
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JadwalCard extends StatelessWidget {
  final String tanggal;
  final String bulan;
  final String hari;
  final String title;
  final String jam;
  final String lokasi;

  const JadwalCard({
    super.key,
    required this.tanggal,
    required this.bulan,
    required this.hari,
    required this.title,
    required this.jam,
    required this.lokasi,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF8FA1B2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [

          /// TANGGAL
          Container(
            width: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(bulan, style: const TextStyle(fontSize: 10)),
                Text(
                  tanggal,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(hari, style: const TextStyle(fontSize: 10)),
              ],
            ),
          ),

          const SizedBox(width: 12),

          /// INFO
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// TITLE (tanpa panah)
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "Jam: $jam WIB",
                  style: const TextStyle(fontSize: 11),
                ),

                const SizedBox(height: 6),

                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Terkonfirmasi',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  lokasi,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}