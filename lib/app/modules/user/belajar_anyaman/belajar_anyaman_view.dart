// belajar_anyaman_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'belajar_anyaman_controller.dart';

class BelajarAnyamanView extends GetView<BelajarAnyamanController> {
  const BelajarAnyamanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      // BOTTOM NAVBAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: controller.changeMenu,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: '',
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 20,
          ),
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
                        'Belajar Anyaman',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 48),
                ],
              ),

              const SizedBox(height: 30),

              // KATEGORI
              const Text(
                'Kategori Materi',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 22),

              SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    categoryItem('Dasar'),
                    categoryItem('Tas'),
                    categoryItem('Caping'),
                    categoryItem('Kipas'),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // MATERI BARU
              const Text(
                'Materi Baru',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [

                    materiItem(
                      title: 'Dasar Anyaman Silang',
                      subtitle:
                          'Belajar Teknik Dasar Anyaman\nSilang Untuk Pemula',
                    ),

                    materiItem(
                      title: 'Membuat Keranjang Bambu',
                      subtitle:
                          'Langkah-Langkah Membuat\nKeranjang Bambu Sederhana',
                    ),

                    materiItem(
                      title: 'Membuat Tas Anyaman',
                      subtitle:
                          'Tutorial Membuat Tas Anyaman\nBambu Yang Cantik Dan Kuat',
                    ),

                    materiItem(
                      title: 'Membuat Tampah Bambu',
                      subtitle:
                          'Tutorial Membuat Tampah Bambu\nBulat Yang Kuat Dan Awet',
                    ),

                    materiItem(
                      title: 'Pola Anyam Kepang',
                      subtitle:
                          'Belajar Teknik Anyaman Kepang\nYang Rapi Dan Kuat',
                    ),

                    materiItem(
                      title: 'Membuat Topi Caping',
                      subtitle:
                          'Langkah-Langkah Membuat\nCaping',
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

  // CATEGORY ITEM
  Widget categoryItem(String title) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFA8B4C3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  // VIDEO ITEM
  Widget materiItem({
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      height: 110,
      decoration: BoxDecoration(
        color: const Color(0xFFA8B4C3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [

          // VIDEO THUMBNAIL
          Container(
            width: 120,
            decoration: const BoxDecoration(
              color: Color(0xFF5B6068),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),

            // nanti isi thumbnail/video
            child: const Center(
              child: Icon(
                Icons.play_circle_fill,
                color: Colors.white,
                size: 42,
              ),
            ),
          ),

          // TEXT
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
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