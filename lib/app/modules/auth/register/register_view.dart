import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  Widget buildInputLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Color(0xFF2F2F2F),
      ),
    );
  }

  InputDecoration buildInputDecoration({Widget? suffixIcon, String? hintText}) {
    return InputDecoration(
      hintText: hintText,

      hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),

      filled: true,
      fillColor: const Color(0xFFE8E0D6),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: Color(0xFF9B6B43)),
      ),

      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),

      suffixIcon: suffixIcon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EEE8),

      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 24,
                left: 24,
                right: 24,
                bottom: 48,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF9B6B43),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // BACK
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  const Center(
                    child: Column(
                      children: [
                        Text(
                          'Daftar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          'Daftar untuk mulai menggunakan layanan.',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // FORM
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NAMA
                    buildInputLabel('Masukkan Nama'),

                    const SizedBox(height: 10),

                    TextField(
                      controller: controller.nameC,
                      decoration: buildInputDecoration(
                        hintText: 'Nama lengkap',
                      ),
                    ),

                    const SizedBox(height: 24),

                    // EMAIL
                    buildInputLabel('Masukkan Email'),

                    const SizedBox(height: 10),

                    TextField(
                      controller: controller.emailC,
                      decoration: buildInputDecoration(hintText: 'Email aktif'),
                    ),

                    const SizedBox(height: 24),

                    // PASSWORD
                    buildInputLabel('Masukkan Password'),

                    const SizedBox(height: 10),

                    Obx(
                      () => TextField(
                        controller: controller.passwordC,

                        obscureText: controller.isHiddenPassword.value,

                        decoration: buildInputDecoration(
                          hintText: 'Password',

                          suffixIcon: IconButton(
                            onPressed: controller.togglePassword,

                            icon: Icon(
                              controller.isHiddenPassword.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,

                              color: const Color(0xFFA0A4B8),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // KONFIRMASI
                    buildInputLabel('Konfirmasi Password'),

                    const SizedBox(height: 10),

                    Obx(
                      () => TextField(
                        controller: controller.confirmPasswordC,

                        obscureText: controller.isHiddenConfirm.value,

                        decoration: buildInputDecoration(
                          hintText: 'Ulangi password',

                          suffixIcon: IconButton(
                            onPressed: controller.toggleConfirmPassword,

                            icon: Icon(
                              controller.isHiddenConfirm.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,

                              color: const Color(0xFFA0A4B8),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),

                    // BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : controller.register,

                          style: ElevatedButton.styleFrom(
                            elevation: 0,

                            backgroundColor: const Color(0xFF9B6B43),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),

                          child: controller.isLoading.value
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Text(
                                  'DAFTAR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
