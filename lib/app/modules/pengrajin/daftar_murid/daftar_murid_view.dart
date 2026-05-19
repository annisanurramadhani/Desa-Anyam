// daftar_murid_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'daftar_murid_controller.dart';

class DaftarMuridView extends GetView<DaftarMuridController> {
  const DaftarMuridView({super.key});

  Widget buildItem({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Icon(icon, size: 15, color: const Color(0xFF6B3408)),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              text,

              style: const TextStyle(
                fontSize: 13,

                height: 1.4,

                color: Colors.black87,
              ),
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
                          Get.offAllNamed('/home-pengrajin');
                        },

                        borderRadius: BorderRadius.circular(30),

                        child: const Padding(
                          padding: EdgeInsets.all(6),

                          child: Icon(
                            Icons.arrow_back,

                            size: 30,

                            color: Colors.black,
                          ),
                        ),
                      ),

                      const Expanded(
                        child: Center(
                          child: Text(
                            'Daftar Murid',

                            style: TextStyle(
                              fontSize: 20,

                              fontWeight: FontWeight.bold,

                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 30),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // SEARCH
                  TextField(
                    controller: controller.searchC,

                    decoration: InputDecoration(
                      hintText: 'Cari nama murid...',

                      hintStyle: const TextStyle(
                        color: Colors.black45,

                        fontSize: 13,
                      ),

                      prefixIcon: const Icon(
                        Icons.search,

                        color: Colors.black54,

                        size: 22,
                      ),

                      filled: true,

                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),

                        borderSide: BorderSide.none,
                      ),

                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),

                        borderSide: BorderSide.none,
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),

                        borderSide: const BorderSide(color: Color(0xFF8B4513)),
                      ),

                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 15,
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

                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(22),

                        border: Border.all(color: const Color(0xFFF1E2D3)),
                      ),

                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              // FOTO
                              Container(
                                width: 54,
                                height: 54,

                                decoration: const BoxDecoration(
                                  color: Color(0xFFF7EBDD),

                                  shape: BoxShape.circle,
                                ),

                                child: const Icon(
                                  Icons.person,

                                  color: Color(0xFF6B3408),

                                  size: 30,
                                ),
                              ),

                              const SizedBox(width: 14),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,

                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        Expanded(
                                          child: Text(
                                            murid['nama'],

                                            style: const TextStyle(
                                              fontSize: 16,

                                              fontWeight: FontWeight.bold,

                                              color: Color(0xFF2B0D0D),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,

                                            vertical: 6,
                                          ),

                                          decoration: BoxDecoration(
                                            color: murid['status'] == 'Selesai'
                                                ? Colors.green.shade100
                                                : Colors.orange.shade100,

                                            borderRadius: BorderRadius.circular(
                                              30,
                                            ),
                                          ),

                                          child: Text(
                                            murid['status'],

                                            style: TextStyle(
                                              fontSize: 11,

                                              fontWeight: FontWeight.bold,

                                              color:
                                                  murid['status'] == 'Selesai'
                                                  ? Colors.green
                                                  : Colors.orange,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const SizedBox(height: 14),

                                    Column(
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

                                    if (murid['status'] != 'Selesai')
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),

                                        child: SizedBox(
                                          width: double.infinity,

                                          height: 42,

                                          child: ElevatedButton(
                                            onPressed: () {
                                              controller
                                                      .muridList[index]['status'] =
                                                  'Selesai';

                                              controller.muridList.refresh();
                                            },

                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: const Color(
                                                0xFF8B4513,
                                              ),

                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                              ),
                                            ),

                                            child: const Text(
                                              'Selesai',

                                              style: TextStyle(
                                                color: Colors.white,

                                                fontSize: 13,

                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ],
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
