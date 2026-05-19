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
        height: 165,

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: bgColor,

          borderRadius: BorderRadius.circular(22),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              crossAxisAlignment: CrossAxisAlignment.start,

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

                    size: 24,
                  ),
                ),

                InkWell(
                  onTap: onTap,

                  borderRadius: BorderRadius.circular(30),

                  child: const Padding(
                    padding: EdgeInsets.all(4),

                    child: Icon(Icons.arrow_forward_ios_rounded, size: 16),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Text(
              title,

              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 6),

            Expanded(
              child: Text(
                subtitle,

                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                  height: 1.4,
                ),

                maxLines: 3,

                overflow: TextOverflow.ellipsis,
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
        padding: const EdgeInsets.all(14),

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
                  padding: const EdgeInsets.all(9),

                  decoration: BoxDecoration(
                    color: const Color(0xFFB87333),

                    borderRadius: BorderRadius.circular(14),
                  ),

                  child: Icon(icon, color: Colors.white, size: 20),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    title,

                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Center(
              child: Text(
                value,

                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,

                  color: Color(0xFFB87333),
                ),
              ),
            ),

            const SizedBox(height: 2),

            Center(
              child: Text(
                subtitle,

                style: const TextStyle(fontSize: 12, color: Colors.black54),
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
        height: 75,

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
                    Icon(Icons.calendar_month_outlined, size: 22),

                    SizedBox(height: 4),

                    Text('Jadwal', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),

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
                    Icon(Icons.home, color: Color(0xFFB87333), size: 22),

                    SizedBox(height: 4),

                    Text(
                      'Beranda',

                      style: TextStyle(
                        color: Color(0xFFB87333),

                        fontWeight: FontWeight.bold,

                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

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
                    Icon(Icons.person_outline, size: 22),

                    SizedBox(height: 4),

                    Text('Profil', style: TextStyle(fontSize: 12)),
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
                    radius: 28,

                    backgroundColor: const Color(0xFFF1E6DC),

                    child: Icon(
                      Icons.person,

                      size: 34,

                      color: Colors.brown.shade900,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Obx(
                          () => Text(
                            'Hi, ${controller.nama.value}',

                            style: const TextStyle(fontSize: 17),
                          ),
                        ),

                        const SizedBox(height: 2),

                        const Text(
                          'Selamat Datang!',

                          style: TextStyle(
                            fontSize: 17,
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

                      size: 26,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // BANNER
              Container(
                width: double.infinity,

                height: 220,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),

                  image: const DecorationImage(
                    image: AssetImage('assets/images/banner2.png'),

                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 22),

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

                  const SizedBox(width: 14),

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

              const SizedBox(height: 14),

              Row(
                children: [
                  Obx(
                    () => buildStatCard(
                      icon: Icons.groups,

                      title: 'Murid',

                      value: controller.jumlahMurid.value.toString(),

                      subtitle: 'Murid Aktif',
                    ),
                  ),

                  const SizedBox(width: 14),

                  Obx(
                    () => buildStatCard(
                      icon: Icons.class_,

                      title: 'Kelas',

                      value: controller.jumlahKelas.value.toString(),

                      subtitle: 'Kelas Aktif',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // JADWAL
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(13),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),

                  color: const Color(0xFFD6E9FF),
                ),

                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        color: Colors.blue.shade400,
                      ),

                      child: const Icon(
                        Icons.calendar_month,

                        color: Colors.white,

                        size: 24,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          const Text(
                            'Jadwal Hari Ini!',

                            style: TextStyle(
                              fontSize: 14,

                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Obx(
                            () => Text(
                              controller.jadwalNama.value,

                              style: const TextStyle(
                                fontSize: 13,

                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          const SizedBox(height: 1),

                          Obx(
                            () => Text(
                              controller.jadwalWaktu.value,

                              style: const TextStyle(
                                fontSize: 10,

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

              //MAIN MENU
              const SizedBox(height: 24),

              const Text(
                'Menu lain',

                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 18),

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
