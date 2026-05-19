// payment_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});

  Widget buildItem({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),

      child: Row(
        children: [
          Icon(icon, size: 15, color: const Color(0xFF6B3408)),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              text,

              style: const TextStyle(fontSize: 13, color: Colors.black87),
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
                            'Payment',

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
                      hintText: 'Cari pembayaran...',

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

                  itemCount: controller.paymentList.length,

                  itemBuilder: (context, index) {
                    final pembayaran = controller.paymentList[index];

                    bool lunas = pembayaran['status'] == 'Lunas';

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),

                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(22),

                        border: Border.all(color: const Color(0xFFF1E2D3)),
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          // ICON
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

                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Expanded(
                                      child: Text(
                                        pembayaran['nama'],

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
                                        color: lunas
                                            ? Colors.green.shade100
                                            : Colors.orange.shade100,

                                        borderRadius: BorderRadius.circular(30),
                                      ),

                                      child: Text(
                                        pembayaran['status'],

                                        style: TextStyle(
                                          fontSize: 11,

                                          fontWeight: FontWeight.bold,

                                          color: lunas
                                              ? Colors.green
                                              : Colors.orange,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 14),

                                buildItem(
                                  icon: Icons.calendar_month,

                                  text: pembayaran['tanggal'],
                                ),

                                buildItem(
                                  icon: Icons.account_balance_wallet,

                                  text: pembayaran['metode'],
                                ),

                                buildItem(
                                  icon: Icons.payments_outlined,

                                  text: pembayaran['harga'],
                                ),

                                if (!lunas)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),

                                    child: SizedBox(
                                      width: double.infinity,

                                      height: 42,

                                      child: ElevatedButton(
                                        onPressed: () {
                                          controller
                                                  .paymentList[index]['status'] =
                                              'Lunas';

                                          controller.paymentList.refresh();
                                        },

                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(
                                            0xFF8B4513,
                                          ),

                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              14,
                                            ),
                                          ),
                                        ),

                                        child: const Text(
                                          'Sudah Dibayar',

                                          style: TextStyle(
                                            fontSize: 13,

                                            fontWeight: FontWeight.bold,

                                            color: Colors.white,
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
