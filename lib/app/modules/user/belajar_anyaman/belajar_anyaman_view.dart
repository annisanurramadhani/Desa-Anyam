import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'belajar_anyaman_controller.dart';

class BelajarAnyamanView extends GetView<BelajarAnyamanController> {
  const BelajarAnyamanView({super.key});

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
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),

            const SizedBox(height: 20),

            /// KATEGORI
            const Text(
              'Kategori Materi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  categoryItem('assets/images/1.png', 'Dasar'),
                  categoryItem('assets/images/2.png', 'Tas'),
                  categoryItem('assets/images/3.png', 'Caping'),
                  categoryItem('assets/images/4.png', 'Kipas'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// MATERI
            const Text(
              'Materi Baru',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            materiItem(
              title: 'Dasar Anyaman Silang',
              subtitle: 'Teknik dasar anyaman untuk pemula',
            ),
            materiItem(
              title: 'Keranjang Bambu',
              subtitle: 'Cara membuat keranjang sederhana',
            ),
            materiItem(
              title: 'Tas Anyaman',
              subtitle: 'Membuat tas bambu yang kuat',
            ),
            materiItem(
              title: 'Tampah Bambu',
              subtitle: 'Anyaman bulat yang rapi',
            ),
          ],
        ),
      ),
    );
  }

  /// CATEGORY
  Widget categoryItem(String imagePath, String title) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// MATERI
  Widget materiItem({
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF8FA1B2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 90,
            decoration: const BoxDecoration(
              color: Color(0xFF5B6068),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: const Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 40,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}