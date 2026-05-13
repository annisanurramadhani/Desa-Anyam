import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class FormPendaftaranView extends StatelessWidget {
  const FormPendaftaranView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments ?? {};

    final namaC = TextEditingController();
    final waC = TextEditingController();
    final emailC = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            /// HEADER
            Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Formulir Pendaftaran",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),

            const SizedBox(height: 10),

            const Text(
              "Lengkapi data diri Anda untuk mendaftar kelas yang telah dipilih.",
              style: TextStyle(fontSize: 13),
            ),

            const SizedBox(height: 20),

            /// CARD FORM
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF2ECE6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  textField("Nama Lengkap", namaC),
                  textField("No. WhatsApp", waC),
                  textField("Email (Opsional)", emailC),

                  textField(
                    "Tanggal Kelas",
                    TextEditingController(text: data["tanggal"] ?? "-"),
                    readOnly: true,
                  ),

                  textField(
                    "Jam Kelas",
                    TextEditingController(text: data["jam"] ?? "-"),
                    readOnly: true,
                  ),

                  textField(
                    "Nama Pelatih",
                    TextEditingController(text: data["pengrajin"] ?? "-"),
                    readOnly: true,
                  ),

                  textField(
                    "Lokasi",
                    TextEditingController(
                      text: data["Balaidesa Dukuhsembung"] ?? "-",
                    ),
                    readOnly: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 🔥 BUTTON DAFTAR
            SizedBox(
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  if (namaC.text.isEmpty || waC.text.isEmpty) {
                    Get.snackbar("Error", "Nama & WhatsApp wajib diisi");
                    return;
                  }

                  Get.toNamed(Routes.PENDAFTARAN_BERHASIL);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B4F3B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  "Daftar",
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
    );
  }

  /// TEXTFIELD TANPA ICON
  Widget textField(
    String label,
    TextEditingController controller, {
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            readOnly: readOnly,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
