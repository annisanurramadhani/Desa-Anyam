import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'form_pendaftaran_controller.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
  const FormPendaftaranView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: controller.changeMenu,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [

              // HEADER
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Formulir Pendaftaran',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 20),

              // FORM BOX
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF8FA1B2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    inputField('Nama Lengkap'),
                    inputField('No. WhatsApp'),
                    inputField('Email (Opsional)'),

                    // TANGGAL
                    inputField(
                      'Tanggal Mulai',
                      suffix: const Icon(Icons.calendar_today, size: 18),
                    ),

                    // JAM
                    inputField(
                      'Jam Kelas',
                      suffix: const Icon(Icons.keyboard_arrow_down),
                    ),

                    // PELATIH
                    inputField(
                      'Nama Pelatih',
                      hint: 'Pak Tarjo',
                    ),

                    // LOKASI
                    inputField(
                      'Lokasi',
                      hint: 'Balaidesa Dukuhsembung',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // BUTTON (FIX PUTIH)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.goToPembayaran,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9B6B43),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Lanjutkan',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white, // ✅ FIX
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 INPUT FIELD (FIX AMAN)
  Widget inputField(
    String label, {
    Widget? suffix,
    String? hint,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),

          const SizedBox(height: 6),

          TextField(
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: suffix,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}