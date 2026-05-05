import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_produk_controller.dart';

class DetailProdukView extends GetView<DetailProdukController> {
  const DetailProdukView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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
                        'Detail Produk',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 16),

              // IMAGE
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/produk.png',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 16),

              // NAMA PRODUK
              const Text(
                'Kerombong Bambu',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                'Rp 55.000',
                style: TextStyle(
                  color: Color(0xFF9B6B43),
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // DESKRIPSI
              const Text(
                'Deskripsi Produk',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 6),

              const Text(
                'Kerombong bambu asli anyaman tangan, solusi wadah tradisional yang kuat dan multifungsi. Cocok untuk kebutuhan logistik, penyimpanan hasil bumi, hingga dekorasi bertema klasik.',
                style: TextStyle(fontSize: 12),
              ),

              const SizedBox(height: 16),

              // DETAIL
              detailRow('Ukuran', '30cm x 25cm x 12cm'),
              detailRow('Bahan', 'Bambu'),
              detailRow('Warna', 'Natural'),
              detailRow('Stok', '55 tersedia'),

              const SizedBox(height: 30),

              // BUTTON WHATSAPP
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: controller.pesanWhatsapp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9B6B43),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: const Icon(Icons.chat, color: Colors.green),
                  label: const Text(
                    'PESAN VIA WHATSAPP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 ROW DETAIL
  Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(title),
          ),
          const Text(': '),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}