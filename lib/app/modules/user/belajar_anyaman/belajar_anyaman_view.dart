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

      /// 🔥 BOTTOM NAVBAR
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
        child: ListView(
          padding: const EdgeInsets.all(20),
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

            /// 🔥 HERO (TANPA FOTO)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFEDE3D7), Color(0xFFF5EFE6)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(Icons.school, size: 40, color: Color(0xFF6B4F3B)),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Pelajari berbagai teknik anyaman bambu dari dasar hingga mahir.',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            /// 🔥 TITLE
            const Text(
              'Materi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E342E),
              ),
            ),

            const SizedBox(height: 16),

            /// 🔥 LIST MATERI (SUDAH ADA VIDEO)
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

  /// 🔥 ITEM MATERI (SUDAH KIRIM VIDEO)
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
            "video": video, // 🔥 INI PENTING
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            /// IMAGE + PLAY ICON
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    image,
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.play_arrow),
                ),
              ],
            ),

            const SizedBox(width: 12),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),

            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
