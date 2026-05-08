import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9B6B43), // 🔥 coklat konsisten

      body: SafeArea(
        child: Column(
          children: [

            // TOP HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 90,
                bottom: 50,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF9B6B43),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
              ),
              child: const Column(
                children: [
                  Text(
                    'Masuk',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

            const SizedBox(height: 8),

                  Text(
                    'Silakan masuk ke akun Anda yang sudah ada',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 🔥 CONTAINER PUTIH
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10), // 🔥 biar ga terlalu ke atas
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // EMAIL
                    const Text(
                      'EMAIL',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF2F2F2F),
                      ),
                    ),

                    const SizedBox(height: 10),

                    TextField(
                      controller: controller.emailC,
                      decoration: InputDecoration(
                        hintText: 'cobacoba@gmail.com',
                        filled: true,
                        fillColor: const Color(0xFFE8EBF0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 18,
                        ),
                      ),
                    ),

                      const SizedBox(height: 16),

                      // PASSWORD
                      const Text('SANDI'),
                      const SizedBox(height: 8),

                    Obx(
                      () => TextField(
                        controller: controller.passwordC,
                        obscureText: controller.isHidden.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFE8EBF0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 18,
                          ),
                          suffixIcon: IconButton(
                            onPressed: controller.togglePassword,
                            icon: Icon(
                              controller.isHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: const Color(0xFF9CA3AF),
                            ),
                          ),
                        ),
                      ),
                    ),

                      const SizedBox(height: 30),

                    // BUTTON LOGIN
                    SizedBox(
                      width: double.infinity,
                      height: 58,
                      child: ElevatedButton(
                        onPressed: controller.login,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: const Color(0xFF9B6B43),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'MASUK',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                      const SizedBox(height: 20),

                      // REGISTER
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Belum punya akun?'),
                          TextButton(
                            onPressed: controller.goToRegister,
                            child: const Text(
                              'DAFTAR',
                              style: TextStyle(
                                color: Color(0xFF9B6B43),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      const Center(child: Text('Atau')),

                      const SizedBox(height: 20),

                    // GOOGLE LOGIN
                    Center(
                      child: InkWell(
                        onTap: controller.loginGoogle,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              'assets/images/google.png',
                              width: 28,
                            ),

                            const SizedBox(width: 10),

                            const Text(
                              'MASUK GOOGLE',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
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
