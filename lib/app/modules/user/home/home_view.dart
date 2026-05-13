import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF6B4F3B),
        unselectedItemColor: Colors.grey,
        onTap: controller.changeMenu,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Jadwal Saya',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: 12),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          color: Color(0xFFE8DED2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person, size: 22),
                      ),

                      const SizedBox(width: 10),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hi, Syifa", style: TextStyle(fontSize: 12)),

                          Text(
                            "Selamat Datang!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  IconButton(
                    onPressed: controller.goToNotification,
                    icon: const Icon(Icons.notifications_none),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// BANNER
              Container(
                width: double.infinity,
                height: width * 0.42,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),

                  image: const DecorationImage(
                    image: AssetImage("assets/images/banner.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),

                child: Container(
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),

                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.65),
                        Colors.transparent,
                      ],

                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),

                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Spacer()],
                  ),
                ),
              ),

              const SizedBox(height: 14),

              /// GRID MENU
              GridView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.9,
                ),

                itemBuilder: (context, index) {
                  final items = [
                    {
                      "icon": Icons.front_hand,
                      "color": Colors.green,
                      "title": "Belajar Anyaman",
                      "desc": "Pelajari teknik dasar dan pola anyaman bambu.",
                      "tap": controller.goToBelajar,
                    },
                    {
                      "icon": Icons.person,
                      "color": Colors.purple,
                      "title": "Profil Pengrajin",
                      "desc": "Kenali pengrajin lokal dan hasil karya mereka.",
                      "tap": controller.goToPengrajin,
                    },
                    {
                      "icon": Icons.inventory,
                      "color": Colors.brown,
                      "title": "Produk Anyaman",
                      "desc": "Lihat berbagai produk anyaman berkualitas.",
                      "tap": controller.goToProduk,
                    },
                    {
                      "icon": Icons.calendar_today,
                      "color": Colors.blue,
                      "title": "Jadwal Saya",
                      "desc": "Cek jadwal kelas dan pelatihan yang diikuti.",
                      "tap": controller.goToJadwal,
                    },
                  ];

                  final item = items[index];

                  return menuCard(
                    icon: item["icon"] as IconData,
                    color: item["color"] as Color,
                    title: item["title"] as String,
                    desc: item["desc"] as String,
                    onTap: item["tap"] as VoidCallback,
                  );
                },
              ),

              const SizedBox(height: 16),

              /// TIPS
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE7EFE5), Color(0xFFDCE8DA)],
                  ),

                  borderRadius: BorderRadius.circular(16),
                ),

                child: const Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(Icons.lightbulb, color: Colors.white),
                    ),

                    SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        "Gunakan bambu yang sudah kering agar hasil anyaman lebih kuat dan tahan lama.",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// MENU CARD
  Widget menuCard({
    required IconData icon,
    required Color color,
    required String title,
    required String desc,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),

      child: Container(
        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ICON
            Container(
              width: 38,
              height: 38,

              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                shape: BoxShape.circle,
              ),

              child: Icon(icon, color: color, size: 20),
            ),

            const SizedBox(width: 10),

            /// TITLE + DESC
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Colors.black54,
                      height: 1.3,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            /// >
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 14,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
