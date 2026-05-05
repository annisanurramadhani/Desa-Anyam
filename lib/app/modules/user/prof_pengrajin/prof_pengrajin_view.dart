import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import 'prof_pengrajin_controller.dart';

class ProfPengrajinView extends GetView<ProfPengrajinController> {
  const ProfPengrajinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [

              // HEADER
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Pengrajin',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 16),

              // SEARCH
              TextField(
                decoration: InputDecoration(
                  hintText: 'cari pengrajin',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color(0xFFE5E5E5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // LIST
              Expanded(
                child: ListView(
                  children: [
                    buildItem('Pak Tarjo', '8+ Tahun', '4.2'),
                    buildItem('Ibu Darsinah', '12+ Tahun', '4.2'),
                    buildItem('Ibu Watri', '6+ Tahun', null),
                    buildItem('Pak Agus', '7+ Tahun', null),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 ITEM YANG SUDAH ADA ONTAP
  Widget buildItem(String nama, String pengalaman, String? rating) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PROFILE_PENGRAJIN); // ✅ pindah ke profile pengrajin
      },
      child: PengrajinCard(
        nama: nama,
        pengalaman: pengalaman,
        rating: rating,
      ),
    );
  }
}

class PengrajinCard extends StatelessWidget {
  final String nama;
  final String pengalaman;
  final String? rating;

  const PengrajinCard({
    super.key,
    required this.nama,
    required this.pengalaman,
    this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF8FA1B2),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          // FOTO
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),

          const SizedBox(width: 14),

          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Text(
                  'Pengrajin Anyaman Bambu',
                  style: TextStyle(fontSize: 13),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Desa Dukuhsembung, Kec. Pangkah\nKab. Tegal, Jawa Tengah',
                  style: TextStyle(fontSize: 11),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Text(pengalaman, style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 12),
                    if (rating != null)
                      Text('⭐ $rating',
                          style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),

          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}