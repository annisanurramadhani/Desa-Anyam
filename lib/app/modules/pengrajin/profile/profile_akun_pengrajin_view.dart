import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_akun_pengrajin_controller.dart';

class ProfileAkunPengrajinView extends GetView<ProfileAkunPengrajinController> {
  const ProfileAkunPengrajinView({super.key});

  Widget buildProfileItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 26),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xFFF5EEE7),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF5C2E00), size: 30),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5C2E00),
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  value,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),

                const SizedBox(height: 16),

                Container(height: 1, color: Colors.brown.shade100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

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
                Get.offAllNamed('/jadwal-pengrajin');
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
                Get.offAllNamed('/home-pengrajin');
              },
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.home_outlined),

                    SizedBox(height: 4),

                    Text('Beranda', style: TextStyle(fontSize: 13)),
                  ],
                ),
              ),
            ),

            // PROFIL
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.person, color: Color(0xFFB87333)),

                    SizedBox(height: 4),

                    Text(
                      'Profil',
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
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              // HEADER
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 28,
                        color: Color(0xFF2B0D0D),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Profil Pengrajin',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2B0D0D),
                          ),
                        ),

                        const SizedBox(height: 2),

                        const Text(
                          'Informasi akun pengrajin',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Get.toNamed('/edit-profile-pengrajin');
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.edit,
                        size: 26,
                        color: Color(0xFF2B0D0D),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // FOTO PROFIL
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  color: Color(0xFFF1E6DC),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 90,
                  color: Color(0xFF5C2E00),
                ),
              ),

              const SizedBox(height: 24),

              // NAMA
              Obx(
                () => Text(
                  controller.nama.value,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5C2E00),
                  ),
                ),
              ),

              const SizedBox(height: 6),

              Obx(
                () => Text(
                  controller.role.value,
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),

              const SizedBox(height: 34),

              // CARD INFORMASI
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5EEE7),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Obx(
                      () => buildProfileItem(
                        icon: Icons.person_outline,
                        title: 'Nama Lengkap',
                        value: controller.nama.value,
                      ),
                    ),

                    Obx(
                      () => buildProfileItem(
                        icon: Icons.email_outlined,
                        title: 'Email',
                        value: controller.email.value,
                      ),
                    ),

                    Obx(
                      () => buildProfileItem(
                        icon: Icons.phone,
                        title: 'No Telepon',
                        value: controller.telepon.value,
                      ),
                    ),

                    Obx(
                      () => buildProfileItem(
                        icon: Icons.calendar_month,
                        title: 'Pengalaman',
                        value: controller.pengalaman.value,
                      ),
                    ),

                    Obx(
                      () => buildProfileItem(
                        icon: Icons.description_outlined,
                        title: 'Deskripsi',
                        value: controller.deskripsi.value,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // BUTTON KELUAR
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'Logout',

                      middleText: 'Apakah Anda yakin ingin keluar?',

                      textConfirm: 'Ya',

                      textCancel: 'Batal',

                      confirmTextColor: Colors.white,

                      buttonColor: const Color(0xFF8B4513),

                      onConfirm: () {
                        Get.offAllNamed('/login');
                      },
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B4513),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  icon: const Icon(Icons.logout, color: Colors.white, size: 24),

                  label: const Text(
                    'KELUAR',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
