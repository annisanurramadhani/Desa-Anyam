import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'profile_pengrajin_controller.dart';

class ProfilePengrajinView extends GetView<ProfilePengrajinController> {
  const ProfilePengrajinView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.data;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF6B4F3B),
        unselectedItemColor: Colors.grey,
        onTap: controller.changeMenu,
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
                      'Profil Pengrajin',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4E342E),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),

            const SizedBox(height: 20),

            /// PROFILE
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    data["image"] ?? 'assets/images/p1.jpg',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data["name"] ?? "Nama",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1E2D3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Pengrajin Anyaman Bambu",
                          style: TextStyle(fontSize: 11),
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Row(
                        children: [
                          Icon(Icons.location_on, size: 14),
                          SizedBox(width: 4),
                          Text(
                            "Desa Dukuhsembung, Tegal",
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            /// 🔥 BUTTON UTAMA (PINDAH KE SINI & DIPERBESAR)
            SizedBox(
              width: double.infinity,
              height: 60, // 🔥 lebih besar
              child: ElevatedButton(
                onPressed: controller.goToBooking,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B4F3B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  "Pesan Kelas",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// 🔥 STATS
            Row(
              children: [
                Expanded(
                  child: statBox(
                    Icons.workspace_premium,
                    data["exp"] ?? "0",
                    "Pengalaman",
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: statBox(
                    Icons.star,
                    data["rating"] ?? "0",
                    "Rating",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// 🔥 WA (SENDIRI, BUKAN SEJAJAR)
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: IconButton(
                  onPressed: controller.openWhatsapp,
                  icon: const FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                    size: 22,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// DESKRIPSI
            containerCard(
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deskripsi Pengrajin",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Pengrajin ini berpengalaman melatih masyarakat dalam teknik anyaman bambu dari dasar hingga mahir.",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget statBox(IconData icon, String value, String label) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: Colors.orange),
          const SizedBox(width: 6),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(label, style: const TextStyle(fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget containerCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF2ECE6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}