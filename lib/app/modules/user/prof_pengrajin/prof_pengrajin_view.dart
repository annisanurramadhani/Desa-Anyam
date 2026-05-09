import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import 'prof_pengrajin_controller.dart';

class ProfPengrajinView extends GetView<ProfPengrajinController> {
  const ProfPengrajinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      /// 🔥 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
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
                        'Pengrajin',
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

              const SizedBox(height: 6),

              /// 🔥 SUBTITLE
              const Text(
                'Temukan pengrajin anyaman bambu.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),

              const SizedBox(height: 16),

              /// 🔥 SEARCH
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0E7DD),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Cari pengrajin...',
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// 🔥 LIST
              Expanded(
                child: ListView(
                  children: [
                    buildItem(
                      image: 'assets/images/p1.jpg',
                      nama: 'Pak Tarjo',
                      pengalaman: '8+ Tahun',
                      rating: '4.2',
                    ),
                    buildItem(
                      image: 'assets/images/p2.jpg',
                      nama: 'Ibu Darsinah',
                      pengalaman: '12+ Tahun',
                      rating: '4.5',
                    ),
                    buildItem(
                      image: 'assets/images/p3.jpg',
                      nama: 'Ibu Watri',
                      pengalaman: '6+ Tahun',
                      rating: '4.5',
                    ),
                    buildItem(
                      image: 'assets/images/p4.jpg',
                      nama: 'Pak Agus',
                      pengalaman: '7+ Tahun',
                      rating: '4.3',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 ITEM CLICK
  Widget buildItem({
    required String image,
    required String nama,
    required String pengalaman,
    required String rating,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Get.toNamed(
          Routes.PROFILE_PENGRAJIN,
          arguments: {
            "name": nama,
            "image": image,
            "exp": pengalaman,
            "rating": rating,
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
          ],
        ),
        child: Row(
          children: [
            /// 🔥 FOTO
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 14),

            /// 🔥 TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xFF4E342E),
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// 🔥 BADGE
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1E2D3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Pengrajin Anyaman Bambu',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// 🔥 LOKASI
                  const Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.black54),
                      SizedBox(width: 4),
                      Text(
                        'Dukuhsembung, Tegal',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  /// 🔥 STATS
                  Row(
                    children: [
                      /// pengalaman
                      Row(
                        children: [
                          const Icon(
                            Icons.workspace_premium,
                            size: 16,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            pengalaman,
                            style: const TextStyle(fontSize: 11),
                          ),
                        ],
                      ),

                      const SizedBox(width: 12),

                      /// divider
                      Container(width: 1, height: 12, color: Colors.grey[300]),

                      const SizedBox(width: 12),

                      /// rating
                      Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(rating, style: const TextStyle(fontSize: 11)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// 🔥 ARROW BULAT
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFFF1E2D3),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
