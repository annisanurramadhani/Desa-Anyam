import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_user_controller.dart';

class ProfileUserView extends GetView<ProfileUserController> {
  const ProfileUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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

            /// 🔥 HEADER (TANPA NOTIFIKASI)
            Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Profil Saya',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4E342E),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 40), // biar balance
              ],
            ),

            const SizedBox(height: 20),

            /// 🔥 PROFILE CARD
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFEBDDCB), Color(0xFFF5EFE6)],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [

                  Row(
                    children: [

                      /// FOTO
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFD9C2A6),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: const Icon(Icons.person, size: 40),
                      ),

                      const SizedBox(width: 14),

                      /// INFO
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Syifa Hadju",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),

                          Row(
                            children: [
                              Icon(Icons.email, size: 16),
                              SizedBox(width: 6),
                              Text("cobacoba@gmail.com"),
                            ],
                          ),

                          SizedBox(height: 4),

                          Row(
                            children: [
                              Icon(Icons.phone, size: 16),
                              SizedBox(width: 6),
                              Text("0895123456"),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// 🔥 QUOTE
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.eco, color: Colors.green),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Terus belajar, berkarya, dan berbagi manfaat.",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 🔥 MENU (SUDAH DIHAPUS DETAIL PESANAN)
            menuCard(
              icon: Icons.edit,
              color: Colors.green,
              title: "Edit Profil",
              desc: "Perbarui informasi pribadi Anda.",
              onTap: controller.goToEdit,
            ),

            menuCard(
              icon: Icons.verified,
              color: Colors.purple,
              title: "Sertifikat",
              desc: "Lihat sertifikat yang telah Anda peroleh.",
              onTap: controller.goToSertifikat,
            ),

            const SizedBox(height: 30),

            /// 🔥 LOGOUT
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: controller.logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  "Keluar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔥 MENU CARD
  Widget menuCard({
    required IconData icon,
    required Color color,
    required String title,
    required String desc,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF2ECE6),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [

            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: color),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),

            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}