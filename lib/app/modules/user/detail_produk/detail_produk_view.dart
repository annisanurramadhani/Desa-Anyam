import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProdukView extends StatelessWidget {
  const DetailProdukView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments ?? {};

    final String image = data["image"] ?? "assets/images/produk1.jpg";
    final String title = data["title"] ?? "Keranjang Bambu";
    final String price = data["price"] ?? "Rp 55.000";
    final String desc =
        data["desc"] ?? "Anyaman bambu asli, kuat dan multifungsi.";

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      /// BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF9B6B43),
        unselectedItemColor: Colors.grey,
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Jadwal Saya'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),

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
                      "Detail Produk",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4E342E),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),

            const SizedBox(height: 16),

            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 16),

            /// TITLE
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4E342E),
              ),
            ),

            const SizedBox(height: 6),

            /// PRICE
            Text(
              price,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF8B5E3C),
              ),
            ),

            const SizedBox(height: 20),

            /// DESKRIPSI TITLE (NO ICON)
            const Text(
              "Deskripsi Produk",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 8),

            /// DESKRIPSI
            Text(
              desc,
              style: const TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 20),

            /// DETAIL BOX (NO ICON)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF2ECE6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  infoItem("Ukuran", "30cm x 25cm x 12cm"),
                  divider(),
                  infoItem("Bahan", "Bambu"),
                  divider(),
                  infoItem("Warna", "Natural"),
                  divider(),
                  infoItem("Stok", "55 tersedia"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// BUTTON (NO ICON + TEXT WHITE)
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9B6B43),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Pesan via WhatsApp",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white, // 🔥 penting
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget divider() {
    return const Divider(height: 20);
  }
}