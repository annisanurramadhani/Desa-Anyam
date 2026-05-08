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
          padding: const EdgeInsets.all(20),
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
                        'Pengrajin',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 16),

              /// SEARCH
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari pengrajin...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: const Color(0xFFEDEDED),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// LIST
              Expanded(
                child: ListView(
                  children: [
                    buildItem('Pak Tarjo', '8+ Tahun', '4.2'),
                    buildItem('Ibu Darsinah', '12+ Tahun', '4.5'),
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

  Widget buildItem(String nama, String pengalaman, String? rating) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PROFILE_PENGRAJIN);
      },
      child: PengrajinCard(
        nama: nama,
        pengalaman: pengalaman,
        rating: rating ?? "0.0", // ✅ default kalau kosong
      ),
    );
  }
}

class PengrajinCard extends StatelessWidget {
  final String nama;
  final String pengalaman;
  final String rating;

  const PengrajinCard({
    super.key,
    required this.nama,
    required this.pengalaman,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [

          /// FOTO
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.person, size: 30),
          ),

          const SizedBox(width: 14),

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  nama,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 2),

                const Text(
                  'Pengrajin Anyaman Bambu',
                  style: TextStyle(fontSize: 12),
                ),

                const SizedBox(height: 6),

                const Text(
                  'Dukuhsembung, Tegal',
                  style: TextStyle(fontSize: 11, color: Colors.black54),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [

                    /// ICON PENGALAMAN
                    const Icon(Icons.workspace_premium,
                        color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      pengalaman,
                      style: const TextStyle(fontSize: 11),
                    ),

                    const SizedBox(width: 12),

                    /// ICON RATING
                    const Icon(Icons.star,
                        color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// ARROW
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}