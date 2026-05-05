import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      // BOTTOM NAVBAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: controller.changeMenu,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE4E4E4),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person, size: 28),
                      ),

                      const SizedBox(width: 10),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Syifa',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Selamat Datang!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: controller.goToNotification,
                    icon: const Icon(Icons.notifications, size: 24),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ✅ BANNER BESAR
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/banner.png',
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              // MENU GRID (LEBIH COMPACT)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.1,
                children: [

                  menuItem(
                    icon: Icons.front_hand,
                    title: 'Belajar\nAnyaman',
                    onTap: controller.goToBelajar,
                  ),

                  menuItem(
                    icon: Icons.person_outline,
                    title: 'Profil\nPengrajin',
                    onTap: controller.goToPengrajin,
                  ),

                  menuItem(
                    icon: Icons.inventory_2_outlined,
                    title: 'Produk\nAnyaman',
                    onTap: controller.goToProduk,
                  ),

                  menuItem(
                    icon: Icons.calendar_today,
                    title: 'Jadwal\nSaya',
                    onTap: controller.goToJadwal,
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // MENU ITEM (VERSI PALING KECIL)
  Widget menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFA8B4C3),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFEAEAEA),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 20,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}