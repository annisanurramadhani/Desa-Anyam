import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pembayaran_controller.dart';

class PembayaranView extends GetView<PembayaranController> {
  const PembayaranView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.data;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              /// 🔥 HEADER
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Pembayaran",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 20),

              /// 🔥 DETAIL PENDAFTARAN (DINAMIS)
              cardBox(
                "Detail Pendaftaran",
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textItem("Nama", data["nama"]),
                    textItem("No WA", data["wa"]),
                    textItem("Tanggal", data["tanggal"]),
                    textItem("Jam", data["jam"]),
                    textItem("Lokasi", data["lokasi"]),
                    textItem("Pengrajin", data["pengrajin"]),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// 🔥 METODE PEMBAYARAN
              cardBox(
                "Metode Pembayaran",
                Obx(
                  () => InkWell(
                    onTap: () => controller.selectMethod(0),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: controller.selectedMethod.value == 0
                              ? const Color(0xFF9B6B43)
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.payments,
                              color: Color(0xFF9B6B43)),

                          const SizedBox(width: 10),

                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cash"),
                                Text(
                                  "Bayar langsung saat kelas dimulai",
                                  style: TextStyle(fontSize: 11),
                                ),
                              ],
                            ),
                          ),

                          Radio(
                            value: 0,
                            groupValue: controller.selectedMethod.value,
                            onChanged: (val) =>
                                controller.selectMethod(val!),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// 🔥 INFO
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE3D7),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Informasi Pembayaran",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text("• Tidak ada pembayaran di aplikasi."),
                    Text("• Bayar langsung ke pelatih saat kelas dimulai."),
                  ],
                ),
              ),

              const Spacer(),

              /// 🔥 BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: controller.bayar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9B6B43),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Saya Mengerti",
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
    );
  }

  /// 🔥 CARD
  Widget cardBox(String title, Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF8FA1B2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  /// 🔥 ITEM TEXT
  Widget textItem(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value?.toString() ?? "-"),
        ],
      ),
    );
  }
}