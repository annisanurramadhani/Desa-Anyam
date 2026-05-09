import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9B6B43),

      body: SafeArea(
        child: Column(
          children: [

            const SizedBox(height: 60),

            /// HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 10),

                  const Expanded(
                    child: Center(
                      child: Text(
                        'Daftar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 34),
                ],
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Daftar untuk mulai menggunakan layanan.',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),

            const SizedBox(height: 30),

            /// FORM
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: double.infinity,
                padding: const EdgeInsets.all(24),
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

                      /// NAMA
                      const Text('NAMA'),
                      const SizedBox(height: 8),
                      input(controller.nameC),

                      const SizedBox(height: 16),

                      /// EMAIL
                      const Text('EMAIL'),
                      const SizedBox(height: 8),
                      input(controller.emailC),

                      const SizedBox(height: 16),

                      /// PASSWORD
                      const Text('SANDI'),
                      const SizedBox(height: 8),
                      Obx(() => inputPassword(
                            controller.passwordC,
                            controller.isHiddenPassword.value,
                            controller.togglePassword,
                          )),

                      const SizedBox(height: 16),

                      /// CONFIRM
                      const Text('ULANG SANDI'),
                      const SizedBox(height: 8),
                      Obx(() => inputPassword(
                            controller.confirmPasswordC,
                            controller.isHiddenConfirm.value,
                            controller.toggleConfirmPassword,
                          )),

                      const SizedBox(height: 30),

                      /// BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: controller.register,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF9B6B43),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'DAFTAR',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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

  /// ✅ INPUT TANPA HINT
  Widget input(TextEditingController c) {
    return TextField(
      controller: c,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE8EBF0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  /// PASSWORD
  Widget inputPassword(
    TextEditingController c,
    bool isHidden,
    VoidCallback toggle,
  ) {
    return TextField(
      controller: c,
      obscureText: isHidden,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE8EBF0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        suffixIcon: IconButton(
          onPressed: toggle,
          icon: Icon(
            isHidden ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}