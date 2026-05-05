import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'booking_kelas_controller.dart';

class BookingKelasView extends GetView<BookingKelasController> {
  const BookingKelasView({super.key});

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
          padding: const EdgeInsets.all(20),
          child: Column(
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
                        'Kelas Pelatihan',
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

              /// CONTAINER UTAMA
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF8FA1B2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    const Text(
                      'Pilih Paket',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      'Pilih durasi paket sesuai kebutuhan belajar',
                      style: TextStyle(fontSize: 11),
                    ),

                    const SizedBox(height: 16),

                    /// JADWAL
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.calendar_month),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '1 Minggu 3x Pertemuan Offline',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          Text(
                            '120 Menit',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// LIST PAKET
                    paketItem(0, '1 Bulan', '12 Pertemuan', 'Rp 299.000'),
                    paketItem(1, '2 Bulan', '24 Pertemuan', 'Rp 549.000'),
                    paketItem(2, '3 Bulan', '36 Pertemuan', 'Rp 799.000'),

                    const SizedBox(height: 16),

                    /// INFO
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.school),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Belajar menganyam dari dasar sampai mahir.',
                              style: TextStyle(fontSize: 11),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.lanjutkan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9B6B43),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Lanjutkan Pemesanan',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// WIDGET PAKET
  Widget paketItem(int index, String title, String sub, String price) {
    return Obx(() {
      final selected = controller.selectedIndex.value == index;

      return GestureDetector(
        onTap: () => controller.selectPaket(index),
        child: Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected ? Colors.brown : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(sub, style: const TextStyle(fontSize: 12)),
                    const SizedBox(height: 6),
                    Text(price,
                        style: const TextStyle(
                            color: Color(0xFF9B6B43),
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              Icon(
                selected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
              )
            ],
          ),
        ),
      );
    });
  }
}