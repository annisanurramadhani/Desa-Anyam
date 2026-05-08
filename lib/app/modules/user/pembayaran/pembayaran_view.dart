import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pembayaran_controller.dart';

class PembayaranView extends GetView<PembayaranController> {
  const PembayaranView({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Pembayaran',
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

              // DETAIL PENDAFTARAN
              box(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Detail Pendaftaran',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

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
              box(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Paket Yang Dipilih',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // TOTAL
              box(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Pembayaran',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
                        const Icon(Icons.check_circle, color: Colors.green),

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
                          onChanged: (value) => controller.selectMethod(value!),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.lanjutPembayaran,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9B6B43),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Lanjutkan Ke Pembayaran'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 BOX REUSABLE
  Widget box({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF8FA1B2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
