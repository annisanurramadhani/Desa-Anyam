import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_pengrajin_controller.dart';

class HomePengrajinView extends GetView<HomePengrajinController> {
  const HomePengrajinView({super.key});

  Widget buildMenuCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color bgColor,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    icon,
                    color: title == 'Pembayaran Cash'
                        ? Colors.green
                        : const Color(0xFF9B6B43),
                    size: 28,
                  ),
                ),

                InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB87333),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(icon, color: Colors.white, size: 22),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB87333),
                ),
              ),
            ),

            const SizedBox(height: 4),

            Center(
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),

      bottomNavigationBar: Container(
        height: 85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // JADWAL
            InkWell(
              onTap: () {
                Get.toNamed('/jadwal-pengrajin');
              },
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.calendar_month_outlined),

                    SizedBox(height: 4),

                    Text('Jadwal', style: TextStyle(fontSize: 13)),
                  ],
                ),
              ),
            ),

            // BERANDA
            InkWell(
              onTap: () {
                Get.toNamed('/home-pengrajin');
              },
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.home, color: Color(0xFFB87333)),

                    SizedBox(height: 4),

                    Text(
                      'Beranda',
                      style: TextStyle(
                        color: Color(0xFFB87333),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // PROFIL
            InkWell(
              onTap: () {
                Get.toNamed('/profile-akun-pengrajin');
              },
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.person_outline),

                    SizedBox(height: 4),

                    Text('Profil', style: TextStyle(fontSize: 13)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFFF1E6DC),
                    child: Icon(
                      Icons.person,
                      size: 36,
                      color: Colors.brown.shade900,
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            'Hi, ${controller.nama.value}',
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),

                        const SizedBox(height: 2),

                        const Text(
                          'Selamat Datang!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2B0D0D),
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      size: 30,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // BANNER
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/banner2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // STAT CARD
              Row(
                children: [
                  Obx(
                    () => buildStatCard(
                      icon: Icons.star,
                      title: 'Rating',
                      value: controller.rating.value.toString(),
                      subtitle: 'dari 5.0',
                    ),
                  ),

                  const SizedBox(width: 16),

                  Obx(
                    () => buildStatCard(
                      icon: Icons.chat_bubble,
                      title: 'Ulasan',
                      value: controller.ulasan.value.toString(),
                      subtitle: 'Total Ulasan',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Obx(
                    () => buildStatCard(
                      icon: Icons.groups,
                      title: 'Jumlah Murid',
                      value: controller.jumlahMurid.value.toString(),
                      subtitle: 'Murid Aktif',
                    ),
                  ),

                  const SizedBox(width: 16),

                  Obx(
                    () => buildStatCard(
                      icon: Icons.class_,
                      title: 'Jumlah Kelas',
                      value: controller.jumlahKelas.value.toString(),
                      subtitle: 'Kelas Aktif',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // JADWAL
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: const Color(0xFFD6E9FF),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue.shade400,
                      ),
                      child: const Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Jadwal Hari Ini!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Obx(
                            () => Text(
                              controller.jadwalNama.value,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          const SizedBox(height: 4),

                          Obx(
                            () => Text(
                              controller.jadwalWaktu.value,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // MENU
              const Text(
                'Menu lain',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  buildMenuCard(
                    icon: Icons.groups,
                    title: 'Daftar Murid',
                    subtitle: 'Lihat dan kelola data murid',
                    bgColor: const Color(0xFFF1E2D3),
                    onTap: () {
                      Get.toNamed('/daftar-murid');
                    },
                  ),

                  const SizedBox(width: 14),

                  buildMenuCard(
                    icon: Icons.payments,
                    title: 'Pembayaran Cash',
                    subtitle: 'Catat pembayaran secara tunai',
                    bgColor: const Color(0xFFDCEEDB),
                    onTap: () {
                      Get.toNamed('/payment');
                    },
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
