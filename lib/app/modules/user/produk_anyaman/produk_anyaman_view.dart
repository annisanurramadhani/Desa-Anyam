import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class ProdukAnyamanView extends StatelessWidget {
  const ProdukAnyamanView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> produk = [
      {
        "image": "assets/images/produk1.jpg",
        "title": "Keranjang Bulat",
        "desc": "Anyaman bambu berkualitas kuat dan tahan lama.",
        "price": "Rp 50.000",
      },
      {
        "image": "assets/images/produk2.jpg",
        "title": "Keranjang Kotak",
        "desc": "Desain modern dan elegan.",
        "price": "Rp 60.000",
      },
      {
        "image": "assets/images/produk3.jpg",
        "title": "Tampah Bambu",
        "desc": "Anyaman bulat tradisional.",
        "price": "Rp 40.000",
      },
      {
        "image": "assets/images/produk4.jpg",
        "title": "Tempat Serbaguna",
        "desc": "Cocok untuk dekorasi rumah.",
        "price": "Rp 55.000",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      /// 🔥 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF6B4F3B),
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
        child: Column(
          children: [
            /// 🔥 HEADER
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Produk Anyaman",
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
            ),

            /// 🔥 SEARCH
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0E7DD),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Cari produk anyaman",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// 🔥 GRID
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: produk.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.9, // ✅ FIX biar tidak kepanjangan
                  ),
                  itemBuilder: (context, index) {
                    final item = produk[index];

                    return InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.DETAIL_PRODUK,
                          arguments: item,
                        );
                      },
                      child: productCard(
                        image: item["image"]!,
                        title: item["title"]!,
                        desc: item["desc"]!,
                        price: item["price"]!,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔥 CARD PRODUK
  Widget productCard({
    required String image,
    required String title,
    required String desc,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              image,
              height: 120, // ✅ lebih pendek biar rapi
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// TEXT
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF4E342E),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xFF4E342E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}