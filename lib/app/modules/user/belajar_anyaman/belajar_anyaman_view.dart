import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import 'belajar_anyaman_controller.dart';

class BelajarAnyamanView extends GetView<BelajarAnyamanController> {
  const BelajarAnyamanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF9B6B43),
        unselectedItemColor: Colors.grey,
        onTap: controller.changeMenu,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Jadwal Saya'),
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
                      'Belajar Anyaman',
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

            /// 🔥 HERO (TANPA ICON - LEBIH ELEGAN)
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFEDE3D7), Color(0xFFF5EFE6)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Pelajari berbagai teknik anyaman bambu dari dasar hingga mahir.',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Materi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E342E),
              ),
            ),

            const SizedBox(height: 14),

            /// LIST
            materiItem(
              image: 'assets/images/m1.png',
              title: 'Dasar Anyaman Silang',
              subtitle: 'Teknik dasar anyaman untuk pemula.',
              video: 'assets/videos/video1.mp4',
            ),
            materiItem(
              image: 'assets/images/m2.png',
              title: 'Keranjang Bambu',
              subtitle: 'Cara membuat keranjang sederhana.',
              video: 'assets/videos/m2.mp4',
            ),
            materiItem(
              image: 'assets/images/m3.png',
              title: 'Tas Anyaman',
              subtitle: 'Membuat tas bambu yang kuat.',
              video: 'assets/videos/m3.mp4',
            ),
            materiItem(
              image: 'assets/images/m4.png',
              title: 'Tampah Bambu',
              subtitle: 'Anyaman bulat yang rapi.',
              video: 'assets/videos/m4.mp4',
            ),
          ],
        ),
      ),
    );
  }

  /// 🔥 ITEM (VERSI CLEAN & MODERN)
  Widget materiItem({
    required String image,
    required String title,
    required String subtitle,
    required String video,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Get.toNamed(
          Routes.DETAIL_MATERI,
          arguments: {
            "title": title,
            "subtitle": subtitle,
            "image": image,
            "video": video,
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [

            /// IMAGE (TANPA PLAY ICON)
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                image,
                width: 100,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// TITLE
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0xFF4E342E),
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// SUBTITLE
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// 🔥 ACCENT LINE (BIAR HIDUP)
                  Container(
                    width: 40,
                    height: 3,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6B4F3B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 6),

            /// ARROW (KEEP BIAR INTERAKTIF)
            const Icon(Icons.arrow_forward_ios, size: 14),
          ],
        ),
      ),
    );
  }
}