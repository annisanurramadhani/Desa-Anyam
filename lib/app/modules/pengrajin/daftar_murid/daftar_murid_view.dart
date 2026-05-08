// daftar_murid_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'daftar_murid_controller.dart';

class DaftarMuridView extends GetView<DaftarMuridController> {
  const DaftarMuridView({super.key});

  Widget buildItem({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF6B3408)),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // HEADER
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            size: 28,
                            color: Color(0xFF2B0D0D),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Daftar Murid',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF2B0D0D),
                              ),
                            ),

                            SizedBox(height: 2),

                            Text(
                              'Kelola data murid pelatihan',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // SEARCH
                  TextField(
                    controller: controller.searchC,
                    decoration: InputDecoration(
                      hintText: 'Cari nama murid...',

                      hintStyle: const TextStyle(color: Colors.black45),

                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.black54,
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide.none,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: BorderSide.none,
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                        borderSide: const BorderSide(color: Color(0xFF8B4513)),
                      ),

                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // LIST
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: controller.muridList.length,
                  itemBuilder: (context, index) {
                    final murid = controller.muridList[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),

                        border: Border.all(color: const Color(0xFFF1E2D3)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // FOTO
                          Container(
                            width: 62,
                            height: 62,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF7EBDD),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.person,
                              color: Color(0xFF6B3408),
                              size: 36,
                            ),
                          ),

                          const SizedBox(width: 16),

                          // CONTENT
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  murid['nama'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2B0D0D),
                                  ),
                                ),

                                const SizedBox(height: 16),

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // LEFT
                                    Expanded(
                                      child: Column(
                                        children: [
                                          buildItem(
                                            icon: Icons.phone_outlined,
                                            text: murid['telepon'],
                                          ),

                                          buildItem(
                                            icon: Icons.email_outlined,
                                            text: murid['email'],
                                          ),

                                          buildItem(
                                            icon: Icons.calendar_month,
                                            text: murid['tanggal'],
                                          ),

                                          buildItem(
                                            icon: Icons.access_time,
                                            text: murid['jam'],
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(width: 18),

                                    // RIGHT
                                    Expanded(
                                      child: Column(
                                        children: [
                                          buildItem(
                                            icon: Icons.person_outline,
                                            text: murid['pengrajin'],
                                          ),

                                          buildItem(
                                            icon: Icons.location_on_outlined,
                                            text: murid['lokasi'],
                                          ),

                                          buildItem(
                                            icon: Icons.payments_outlined,
                                            text: murid['harga'],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
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
}
