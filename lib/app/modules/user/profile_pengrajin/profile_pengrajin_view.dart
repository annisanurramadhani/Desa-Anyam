import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'profile_pengrajin_controller.dart';

class ProfilePengrajinView extends GetView<ProfilePengrajinController> {
  const ProfilePengrajinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
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
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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

                  /// FOTO
                  Container(
                    width: 85,
                    height: 85,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(width: 16),

                  /// INFO
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          'Pak Tarjo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),

                        const SizedBox(height: 4),

                        const Text(
                          'Pengrajin Anyaman Bambu',
                          style: TextStyle(fontSize: 12),
                        ),

                        const SizedBox(height: 6),

                        const Text(
                          'Desa Dukuhsembung, Kec. Pangkah\nKab. Tegal',
                          style: TextStyle(fontSize: 11),
                        ),

                        const SizedBox(height: 10),

                        /// BUTTON PENGRAJIN (🔥 FIX)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF9B6B43),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Pengrajin',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// STATS + ACTION
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  /// PENGALAMAN
                  Column(
                    children: const [
                      Icon(Icons.workspace_premium, color: Colors.orange),
                      SizedBox(height: 4),
                      Text('8+ Tahun', style: TextStyle(fontSize: 11)),
                      Text('Pengalaman', style: TextStyle(fontSize: 10)),
                    ],
                  ),

                  /// RATING
                  Column(
                    children: const [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(height: 4),
                      Text('4.7', style: TextStyle(fontSize: 11)),
                      Text('Rating', style: TextStyle(fontSize: 10)),
                    ],
                  ),

                  /// WHATSAPP
                  GestureDetector(
                    onTap: controller.openWhatsapp,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const FaIcon(
                        FontAwesomeIcons.whatsapp,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),

                  /// BUTTON PESAN
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: controller.goToBooking,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9B6B43),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      child: const Text(
                        'Pesan Kelas',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

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
                      'Deskripsi Pengrajin',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Pak Tarjo adalah pengrajin anyaman bambu berpengalaman yang aktif melatih masyarakat.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Ulasan Pelanggan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}