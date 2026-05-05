import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_paket_controller.dart';

class DetailPaketView extends GetView<DetailPaketController> {
  const DetailPaketView({super.key});

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
                        'Detail Paket',
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

              /// PAKET
              containerCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      'Paket 2 Bulan',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Text('24 Pertemuan'),

                    const SizedBox(height: 6),

                    const Text(
                      'Rp 549.000',
                      style: TextStyle(
                        color: Color(0xFF9B6B43),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 14),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        fiturItem(Icons.verified, 'Pelatih'),
                        fiturItem(Icons.calendar_today, '1 Minggu 3x'),
                        fiturItem(Icons.workspace_premium, 'Sertifikat'),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// PELATIH
              containerCard(
                child: Row(
                  children: [

                    Container(
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pak Tarjo',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text('⭐ 4.7'),
                          Text(
                            'Pengrajin Anyaman Sejak Tahun 2018',
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                    ),

                    ElevatedButton(
                      onPressed: controller.gantiPengajar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9B6B43),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Ganti',
                        style: TextStyle(fontSize: 11),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// DESKRIPSI
              containerCard(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deskripsi Paket',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Deskripsi paket untuk belajar lebih mendalam selama 2 bulan.',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 8),
                    Text('• Materi dasar hingga lanjutan'),
                    Text('• 24x pertemuan praktik'),
                    Text('• Didampingi pelatih'),
                    Text('• Sertifikat selesai'),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// WIDGET CARD
  Widget containerCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF8FA1B2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}

/// FITUR ITEM
class fiturItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const fiturItem(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}