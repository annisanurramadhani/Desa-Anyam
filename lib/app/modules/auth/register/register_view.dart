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

            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),

              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed('/login');
                    },

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

            // FORM
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
                      // USERNAME
                      const Text('USERNAME'),

                      const SizedBox(height: 8),

                      input(controller.nameC, 'Masukkan Username'),

                      const SizedBox(height: 16),

                      // EMAIL
                      const Text('EMAIL'),

                      const SizedBox(height: 8),

                      inputEmail(controller.emailC, 'Masukkan Email'),

                      const SizedBox(height: 16),

                      // PASSWORD
                      const Text('SANDI'),

                      const SizedBox(height: 8),

                      Obx(
                        () => inputPassword(
                          controller.passwordC,

                          controller.isHiddenPassword.value,

                          controller.togglePassword,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // CONFIRM PASSWORD
                      const Text('ULANG SANDI'),

                      const SizedBox(height: 8),

                      Obx(
                        () => inputPassword(
                          controller.confirmPasswordC,

                          controller.isHiddenConfirm.value,

                          controller.toggleConfirmPassword,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // BUTTON
                      Obx(
                        () => SizedBox(
                          width: double.infinity,

                          height: 55,

                          child: ElevatedButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.register,

                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF9B6B43),

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),

                            child: controller.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text(
                                    'DAFTAR',

                                    style: TextStyle(
                                      color: Colors.white,

                                      fontWeight: FontWeight.bold,
                                    ),
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

  // INPUT BIASA
  Widget input(TextEditingController c, String hint) {
    return TextField(
      controller: c,

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        hintText: hint,

        hintStyle: const TextStyle(color: Colors.black38),

        filled: true,

        fillColor: const Color(0xFFE8EBF0),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // INPUT EMAIL
  Widget inputEmail(TextEditingController c, String hint) {
    return TextField(
      controller: c,

      keyboardType: TextInputType.emailAddress,

      textInputAction: TextInputAction.next,

      decoration: InputDecoration(
        hintText: hint,

        hintStyle: const TextStyle(color: Colors.black38),

        filled: true,

        fillColor: const Color(0xFFE8EBF0),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  // INPUT PASSWORD
  Widget inputPassword(
    TextEditingController c,
    bool isHidden,
    VoidCallback toggle,
  ) {
    return TextField(
      controller: c,

      obscureText: isHidden,

      textInputAction: TextInputAction.done,

      decoration: InputDecoration(
        hintText: 'Masukkan Password',

        hintStyle: const TextStyle(color: Colors.black38),

        filled: true,

        fillColor: const Color(0xFFE8EBF0),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),

          borderSide: BorderSide.none,
        ),

        suffixIcon: IconButton(
          onPressed: toggle,

          icon: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}
