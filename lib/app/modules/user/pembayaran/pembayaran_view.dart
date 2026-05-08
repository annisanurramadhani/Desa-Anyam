import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pembayaran_controller.dart';

class PembayaranView extends GetView<PembayaranController> {
  const PembayaranView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.data;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
                        "Pembayaran",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 20),

              // DETAIL PENDAFTARAN
              cardBox(
                'Detail Pendaftaran',
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 10),
                    Text('Nama Lengkap        : Syifa Hadju'),
                    Text('No. WhatsApp         : 08123456789'),
                    Text('Tanggal Mulai Kelas  : 06 April 2026'),
                    Text('Jam Kelas            : 09.00'),
                    Text('Lokasi               : Balaidesa Dukuhsembung'),
                    Text('Pengrajin            : Pak Tarjo'),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // PAKET
              cardBox(
                'Paket Yang Dipilih',
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 10),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Paket 2 Bulan',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('24 Pertemuan'),
                            SizedBox(height: 4),
                            Text(
                              'Rp 549.000',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // TOTAL
              cardBox(
                'Total Pembayaran',
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 6),
                    Text(
                      'Rp 549.000',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              const Text('Pilih Metode Pembayaran'),

              const SizedBox(height: 10),

              // METODE PEMBAYARAN
              Obx(
                () => InkWell(
                  onTap: () => controller.selectMethod(0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: controller.selectedMethod.value == 0
                            ? Colors.green
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ),

                        const SizedBox(width: 10),

                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Cash (Bayar di Tempat)'),
                              Text(
                                'Bayar Saat Hari Pertama Kelas',
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
                          ),
                        ),

                        Radio(
                          value: 0,
                          groupValue: controller.selectedMethod.value,
                          onChanged: (value) =>
                              controller.selectMethod(value!),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // BUTTON
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
                    "Pesan Sekarang",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
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

  Widget cardBox(String title, Widget child) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF8FA1B2),
        borderRadius: BorderRadius.circular(16),
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
}