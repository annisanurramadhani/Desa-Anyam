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
      padding: const EdgeInsets.only(bottom: 20),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: 50,
            height: 50,

            decoration: const BoxDecoration(
              color: Color(0xFFF5EEE7),

              shape: BoxShape.circle,
            ),

            child: Icon(icon, color: const Color(0xFF5C2E00), size: 24),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 14,

                    fontWeight: FontWeight.bold,

                    color: Color(0xFF5C2E00),
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  value,

                  style: const TextStyle(
                    fontSize: 14,

                    color: Colors.black87,

                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 12),

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
                    Icon(Icons.calendar_month_outlined, size: 22),

                    SizedBox(height: 4),

                    Text('Jadwal', style: TextStyle(fontSize: 12)),
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
                    Icon(Icons.home_outlined, size: 22),

                    SizedBox(height: 4),

                    Text('Beranda', style: TextStyle(fontSize: 12)),
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
                    Icon(Icons.person, color: Color(0xFFB87333), size: 22),

                    SizedBox(height: 4),

                    Text(
                      'Profil',

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
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),

          child: Column(
            children: [
              // HEADER
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.offAllNamed('/home-pengrajin');
                    },

                    borderRadius: BorderRadius.circular(30),

                    child: const Padding(
                      padding: EdgeInsets.all(6),

                      child: Icon(
                        Icons.arrow_back,

                        size: 28,

                        color: Colors.black,
                      ),
                    ),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        'Profil',

                        style: TextStyle(
                          fontSize: 20,

                          fontWeight: FontWeight.bold,

                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Get.toNamed('/edit-profile-pengrajin');
                    },

                    borderRadius: BorderRadius.circular(30),

                    child: const Padding(
                      padding: EdgeInsets.all(6),

                      child: Icon(Icons.edit, size: 24, color: Colors.black),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 22),

              // FOTO
              Container(
                width: 125,
                height: 125,

                decoration: const BoxDecoration(
                  color: Color(0xFFF1E6DC),

                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.person,

                  size: 72,

                  color: Color(0xFF5C2E00),
                ),
              ),

              const SizedBox(height: 20),

              // NAMA
              Obx(
                () => Text(
                  controller.nama.value,

                  style: const TextStyle(
                    fontSize: 24,

                    fontWeight: FontWeight.bold,

                    color: Color(0xFF5C2E00),
                  ),
                ),
              ),

              const SizedBox(height: 4),

              Obx(
                () => Text(
                  controller.role.value,

                  style: const TextStyle(fontSize: 15, color: Colors.black54),
                ),
              ),

              const SizedBox(height: 24),

              // CARD INFO
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: const Color(0xFFF5EEE7),

                  borderRadius: BorderRadius.circular(24),

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

              const SizedBox(height: 24),
              // BUTTON LOGOUT
              SizedBox(
                width: double.infinity,

                height: 48,

                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.defaultDialog(
                      title: 'Logout',

                      middleText: 'Apakah Anda yakin ingin keluar?',

                      textConfirm: 'Ya',

                      textCancel: 'Batal',

                      confirmTextColor: Colors.white,

                      buttonColor: Colors.red,

                      onConfirm: () {
                        Get.offAllNamed('/login');
                      },
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  icon: const Icon(Icons.logout, color: Colors.white, size: 20),

                  label: const Text(
                    'KELUAR',

                    style: TextStyle(
                      fontSize: 15,

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
