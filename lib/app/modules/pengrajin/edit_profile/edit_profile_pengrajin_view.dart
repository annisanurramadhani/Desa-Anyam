import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_profile_pengrajin_controller.dart';

class EditProfilePengrajinView extends GetView<EditProfilePengrajinController> {
  const EditProfilePengrajinView({super.key});

  Widget buildInput({
    required String title,
    required TextEditingController controllerText,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),

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

          const SizedBox(height: 8),

          TextField(
            controller: controllerText,

            maxLines: maxLines,

            style: const TextStyle(fontSize: 14),

            decoration: InputDecoration(
              prefixIcon: maxLines == 1
                  ? Icon(icon, color: const Color(0xFF8B4513), size: 22)
                  : Padding(
                      padding: const EdgeInsets.only(left: 14, bottom: 60),

                      child: Icon(
                        icon,

                        color: const Color(0xFF8B4513),

                        size: 22,
                      ),
                    ),

              prefixIconConstraints: const BoxConstraints(
                minWidth: 48,
                minHeight: 48,
              ),

              filled: true,

              fillColor: const Color(0xFFF5EEE7),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),

                borderSide: BorderSide.none,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),

                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),

                borderSide: const BorderSide(
                  color: Color(0xFF8B4513),

                  width: 1,
                ),
              ),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
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

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(18),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // HEADER
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.offAllNamed('/profile-akun-pengrajin');
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
                        'Edit Profil',

                        style: TextStyle(
                          fontSize: 20,

                          fontWeight: FontWeight.bold,

                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 28),
                ],
              ),

              const SizedBox(height: 22),

              // FOTO
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 120,
                      height: 120,

                      decoration: const BoxDecoration(
                        color: Color(0xFFF1E6DC),

                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.person,

                        size: 70,

                        color: Color(0xFF5C2E00),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,

                      child: Container(
                        width: 40,
                        height: 40,

                        decoration: const BoxDecoration(
                          color: Color(0xFF8B4513),

                          shape: BoxShape.circle,
                        ),

                        child: const Icon(
                          Icons.camera_alt,

                          color: Colors.white,

                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 26),

              // FORM
              buildInput(
                title: 'Nama Lengkap',

                controllerText: controller.namaC,

                icon: Icons.person_outline,
              ),

              buildInput(
                title: 'Email',

                controllerText: controller.emailC,

                icon: Icons.email_outlined,
              ),

              buildInput(
                title: 'No Telepon',

                controllerText: controller.teleponC,

                icon: Icons.phone,
              ),

              buildInput(
                title: 'Pengalaman',

                controllerText: controller.pengalamanC,

                icon: Icons.calendar_month,
              ),

              buildInput(
                title: 'Deskripsi',

                controllerText: controller.deskripsiC,

                icon: Icons.description_outlined,

                maxLines: 3,
              ),

              const SizedBox(height: 8),

              // BUTTON
              SizedBox(
                width: double.infinity,

                height: 48,

                child: ElevatedButton(
                  onPressed: () {
                    controller.simpanProfile();
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  child: const Text(
                    'Simpan Perubahan',

                    style: TextStyle(
                      fontSize: 15,

                      fontWeight: FontWeight.bold,

                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
