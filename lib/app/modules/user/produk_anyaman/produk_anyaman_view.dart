import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class ProdukAnyamanView extends StatelessWidget {
  const ProdukAnyamanView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final List<Map<String, String>> produk = [
      {
        "image": "assets/images/produk1.jpg",
        "title": "Keranjang Bulat",
        "desc": "Anyaman bambu kuat dan tahan lama.",
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
        "desc": "Anyaman tradisional.",
        "price": "Rp 40.000",
      },
      {
        "image": "assets/images/produk4.jpg",
        "title": "Tempat Serbaguna",
        "desc": "Cocok dekorasi rumah.",
        "price": "Rp 55.000",
      },
    ];

    /// 🔥 RESPONSIVE GRID COUNT
    int crossAxis = width > 600 ? 3 : 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

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
        child: Column(
          children: [

            /// HEADER
            Padding(
              padding: EdgeInsets.all(width * 0.05),
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF9B6B43),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.1),
                ],
              ),
            ),

            /// SEARCH
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
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

            SizedBox(height: width * 0.04),

            /// GRID
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: GridView.builder(
                  itemCount: produk.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxis,
                    crossAxisSpacing: width * 0.03,
                    mainAxisSpacing: width * 0.03,
                    childAspectRatio: 0.78, // 🔥 FIX OVERFLOW
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
                      child: productCard(context,
                          image: item["image"]!,
                          title: item["title"]!,
                          desc: item["desc"]!,
                          price: item["price"]!),
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

  /// 🔥 CARD RESPONSIVE
  Widget productCard(
    BuildContext context, {
    required String image,
    required String title,
    required String desc,
    required String price,
  }) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE (RESPONSIVE HEIGHT)
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
                child: Image.asset(
                  image,
                  height: width * 0.35, // 🔥 RESPONSIVE
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9B6B43),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    price,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: width * 0.025,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// TEXT
          Padding(
            padding: EdgeInsets.all(width * 0.025),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.035,
                    color: const Color(0xFF9B6B43),
                  ),
                ),

                SizedBox(height: width * 0.01),

                Text(
                  desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: width * 0.028,
                    color: Colors.black54,
                  ),
                ),

                SizedBox(height: width * 0.015),

                Text(
                  "Lihat Detail",
                  style: TextStyle(
                    fontSize: width * 0.028,
                    color: const Color(0xFF9B6B43),
                    fontWeight: FontWeight.w600,
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