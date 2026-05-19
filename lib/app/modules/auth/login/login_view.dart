import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9B6B43),

      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,

              padding: const EdgeInsets.only(top: 80, bottom: 40),

              decoration: const BoxDecoration(
                color: Color(0xFF9B6B43),

                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),

              child: const Column(
                children: [
                  Text(
                    'Masuk',

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Silakan masuk ke akun Anda',

                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),

            // FORM
            Expanded(
              child: Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),

                decoration: const BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // EMAIL
                      const Text(
                        'EMAIL',

                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 8),

                      TextField(
                        controller: controller.emailC,

                        keyboardType: TextInputType.emailAddress,

                        textInputAction: TextInputAction.next,

                        decoration: InputDecoration(
                          hintText: 'email@gmail.com',

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

                      const SizedBox(height: 20),

                      // PASSWORD
                      const Text(
                        'PASSWORD',

                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 8),

                      Obx(
                        () => TextField(
                          controller: controller.passwordC,

                          obscureText: controller.isHidden.value,

                          textInputAction: TextInputAction.done,

                          onSubmitted: (_) {
                            controller.login();
                          },

                          decoration: InputDecoration(
                            hintText: 'Masukkan password',

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
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // BUTTON LOGIN
                      Obx(
                        () => SizedBox(
                          width: double.infinity,

                          height: 55,

                          child: ElevatedButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : () {
                                    controller.login();
                                  },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF9B6B43),

                              elevation: 0,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),

                            child: controller.isLoading.value
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,

                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    'MASUK',

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
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
                          onTap: () {
                            controller.loginGoogle();
                          },

                          borderRadius: BorderRadius.circular(10),

                          child: Padding(
                            padding: const EdgeInsets.all(8),

                            child: Row(
                              mainAxisSize: MainAxisSize.min,

                              children: [
                                Image.asset(
                                  'assets/images/google.png',
                                  width: 24,
                                ),

                                const SizedBox(width: 10),

                                const Text('Masuk dengan Google'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
