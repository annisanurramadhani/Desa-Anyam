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
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5C2E00),
            ),
          ),

          const SizedBox(height: 10),

          TextField(
            controller: controllerText,
            maxLines: maxLines,

            decoration: InputDecoration(
              prefixIcon: maxLines == 1
                  ? Icon(icon, color: const Color(0xFF8B4513))
                  : Padding(
                      padding: const EdgeInsets.only(left: 14, bottom: 70),
                      child: Icon(icon, color: const Color(0xFF8B4513)),
                    ),

              prefixIconConstraints: const BoxConstraints(
                minWidth: 50,
                minHeight: 50,
              ),

              filled: true,
              fillColor: const Color(0xFFF5EEE7),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(
                  color: Color(0xFF8B4513),
                  width: 1,
                ),
              ),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
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
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      children: const [
                        Text(
                          'Edit Profil',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2B0D0D),
                          ),
                        ),

                        SizedBox(height: 2),

                        Text(
                          'Ubah informasi akun pengrajin',
                          style: TextStyle(fontSize: 14, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // FOTO PROFIL
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF1E6DC),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 80,
                        color: Color(0xFF5C2E00),
                      ),
                    ),

                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: const BoxDecoration(
                          color: Color(0xFF8B4513),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

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
                maxLines: 4,
              ),

              const SizedBox(height: 14),

              // BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    controller.simpanProfile();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8B4513),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Simpan Perubahan',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
