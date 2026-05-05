import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_pengrajin_controller.dart';

class ProfilePengrajinView extends GetView<ProfilePengrajinController> {
  const ProfilePengrajinView({super.key});

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Profil Pengrajin',
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

              const SizedBox(height: 20),

              /// PROFILE
              Row(
                children: [

                  // FOTO
                  Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(width: 16),

                  // INFO
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          'Pak Tarjo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),

                        const Text(
                          'Pengrajin Anyaman Bambu',
                          style: TextStyle(fontSize: 12),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          'Desa Dukuhsembung, Kec. Pangkah\nKab. Tegal, Jawa Tengah',
                          style: TextStyle(fontSize: 11),
                        ),

                        const SizedBox(height: 8),

                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF9B6B43),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Pengrajin',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// STATS + BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    children: const [
                      Icon(Icons.workspace_premium, size: 18),
                      SizedBox(height: 4),
                      Text('8+ Tahun', style: TextStyle(fontSize: 11)),
                      Text('Pengalaman', style: TextStyle(fontSize: 10)),
                    ],
                  ),

                  Column(
                    children: const [
                      Icon(Icons.star, size: 18),
                      SizedBox(height: 4),
                      Text('4.7', style: TextStyle(fontSize: 11)),
                      Text('Rating', style: TextStyle(fontSize: 10)),
                    ],
                  ),

                  const Icon(Icons.chat, color: Colors.green),

                  ElevatedButton(
                    onPressed: controller.goToBooking,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9B6B43),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Pesan Kelas Pelatihan',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// DESKRIPSI
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF8FA1B2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi Singkat Pengrajin',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Pak Tarjo adalah pengrajin anyaman bambu dari Desa Dukuhsembung yang telah berpengalaman selama bertahun-tahun. Ia menghasilkan berbagai kerajinan berkualitas dan aktif melatih masyarakat.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// ULASAN
              const Text(
                'Ulasan Pelanggan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}