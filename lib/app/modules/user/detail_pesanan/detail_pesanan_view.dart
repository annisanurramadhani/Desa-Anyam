import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_pesanan_controller.dart';

class DetailPesananView extends GetView<DetailPesananController> {
  const DetailPesananView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = controller.data;

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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          "Detail Pesanan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),

                const SizedBox(height: 20),

                /// STATUS (LEBIH MENARIK)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.check_circle, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Pembayaran Berhasil",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                /// DATA DIRI
                cardDetail(
                  title: "Data Pemesan",
                  children: [
                    textItem("Nama", data["nama"]),
                    textItem("No WA", data["wa"]),
                  ],
                ),

                const SizedBox(height: 16),

                /// DETAIL KELAS
                cardDetail(
                  title: "Detail Kelas",
                  children: [
                    textItem("Tanggal", data["tanggal"]),
                    textItem("Jam", data["jam"]),
                    textItem("Pengrajin", data["pengrajin"]),
                    textItem("Lokasi", data["lokasi"]),
                  ],
                ),

                const SizedBox(height: 16),

                /// PEMBAYARAN
                cardDetail(
                  title: "Pembayaran",
                  children: [
                    textItem("Metode", "Cash"),
                    textItem("Jumlah", "Rp ${data["harga"] ?? 0}"),
                  ],
                ),

                const SizedBox(height: 30),

                /// BUTTON (SAMA SEMUA HALAMAN 🔥)
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: controller.goToHome,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9B6B43),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "Kembali ke Beranda",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// CARD UI (LEBIH RAPI 🔥)
  Widget cardDetail({required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF8FA1B2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  /// ITEM TEXT (LEBIH CLEAN)
  Widget textItem(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          Text(
            value?.toString() ?? "-",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
