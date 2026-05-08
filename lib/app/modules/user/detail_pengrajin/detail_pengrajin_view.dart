import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_pengrajin_controller.dart';

class DetailPengrajinView extends GetView<DetailPengrajinController> {
  const DetailPengrajinView({super.key});

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
                        'Detail Pengrajin',
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

              const SizedBox(height: 20),

              // FOTO + INFO
              Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Pak Tarjo',
                          style: TextStyle(
                            fontSize: 18,
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

                        const SizedBox(height: 10),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
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

              // STATS + BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.workspace_premium),
                      SizedBox(height: 4),
                      Text('8+ Tahun', style: TextStyle(fontSize: 12)),
                      Text('Pengalaman', style: TextStyle(fontSize: 10)),
                    ],
                  ),

                  Column(
                    children: const [
                      Icon(Icons.star_border),
                      SizedBox(height: 4),
                      Text('4.7', style: TextStyle(fontSize: 12)),
                      Text('Rating', style: TextStyle(fontSize: 10)),
                    ],
                  ),

                  const Icon(Icons.chat, color: Colors.green),

                  // 🔥 BUTTON FIX
                  ElevatedButton(
                    onPressed: controller.goToBooking,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9B6B43),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Pesan Kelas',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white, // ✅ FIX PUTIH
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // DESKRIPSI
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
                      'Pak Tarjo adalah pengrajin anyaman bambu berpengalaman yang siap membimbing kamu belajar secara langsung dengan sistem fleksibel (pilih tanggal & jam sendiri).',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Ulasan Pelanggan',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}