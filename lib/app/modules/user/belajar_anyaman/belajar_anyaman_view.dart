import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import 'belajar_anyaman_controller.dart';

class BelajarAnyamanView extends GetView<BelajarAnyamanController> {
  const BelajarAnyamanView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF9B6B43),
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
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, // 🔥 RESPONSIVE
            vertical: 16,
          ),
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9B6B43),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.1),
              ],
            ),

            SizedBox(height: width * 0.02),

            const Center(
              child: Text(
                'Pelajari berbagai teknik anyaman bambu dari dasar hingga mahir.',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ),
            SizedBox(height: width * 0.04),

            /// LIST
            materiItem(
              context,
              image: 'assets/images/m1.png',
              title: 'Dasar Anyaman Silang',
              subtitle: 'Teknik dasar anyaman untuk pemula.',
              video: 'assets/videos/video1.mp4',
            ),
            materiItem(
              context,
              image: 'assets/images/m2.png',
              title: 'Keranjang Bambu',
              subtitle: 'Cara membuat keranjang sederhana.',
              video: 'assets/videos/m2.mp4',
            ),
            materiItem(
              context,
              image: 'assets/images/m3.png',
              title: 'Tas Anyaman',
              subtitle: 'Membuat tas bambu yang kuat.',
              video: 'assets/videos/m3.mp4',
            ),
            materiItem(
              context,
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

  /// 🔥 ITEM RESPONSIVE
  Widget materiItem(
    BuildContext context, {
    required String image,
    required String title,
    required String subtitle,
    required String video,
  }) {
    final width = MediaQuery.of(context).size.width;

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
        margin: EdgeInsets.only(bottom: width * 0.03),
        padding: EdgeInsets.all(width * 0.03),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8),
          ],
        ),
        child: Row(
          children: [
            /// IMAGE RESPONSIVE
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                image,
                width: width * 0.25, // 🔥 RESPONSIVE
                height: width * 0.2,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: width * 0.03),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: width * 0.035, // 🔥 RESPONSIVE
                      color: const Color(0xFF9B6B43),
                    ),
                  ),
                  SizedBox(height: width * 0.015),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: width * 0.03,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: width * 0.02),

                  Container(
                    width: width * 0.1,
                    height: 3,
                    decoration: BoxDecoration(
                      color: const Color(0xFF6B4F3B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: width * 0.02),

            Icon(
              Icons.arrow_forward_ios,
              size: width * 0.04,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
