import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'booking_kelas_controller.dart';

class BookingKelasView extends GetView<BookingKelasController> {
  const BookingKelasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      /// 🔥 BOTTOM NAV
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
                      "Booking Kelas",
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

            const SizedBox(height: 20),

            /// PILIH TANGGAL
            const Text(
              "Pilih Tanggal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF4E342E),
              ),
            ),

            const SizedBox(height: 10),

            Obx(
              () => InkWell(
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030),
                  );

                  if (picked != null) {
                    controller.pickDate(picked);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2ECE6),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFE0D6C8)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Color(0xFF6B4F3B),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          controller.selectedDate.value == null
                              ? "Pilih tanggal"
                              : controller.selectedDate.value!.toString().split(
                                  " ",
                                )[0],
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// PILIH JAM
            const Text(
              "Pilih Jam",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Color(0xFF4E342E),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: ["09:00", "12:00", "15:00"].map((time) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Obx(() {
                      bool selected = controller.selectedTime.value == time;

                      return GestureDetector(
                        onTap: () => controller.pickTime(time),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: selected
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF8B5E3C),
                                      Color(0xFF6B4F3B),
                                    ],
                                  )
                                : null,
                            color: selected ? null : const Color(0xFFF2ECE6),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFD8CBB8)),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  time,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: selected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),

                              if (selected)
                                Positioned(
                                  right: 8,
                                  top: 8,
                                  child: Container(
                                    width: 22,
                                    height: 22,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      size: 14,
                                      color: Color(0xFF6B4F3B),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 20),

            /// HARGA
            Row(
              children: const [
                Icon(Icons.sell, color: Color(0xFF6B4F3B)),
                SizedBox(width: 10),
                Text(
                  "Rp 50.000 / sesi",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// RINGKASAN
            Obx(
              () => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2ECE6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.description, color: Color(0xFF6B4F3B)),
                        SizedBox(width: 10),
                        Text(
                          "Ringkasan Pemesanan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    summaryItem("Pengrajin", controller.data["name"] ?? "-"),

                    summaryItem("Kelas", "Pengrajin Anyaman Bambu"),

                    summaryItem(
                      "Tanggal",
                      controller.selectedDate.value == null
                          ? "-"
                          : controller.selectedDate.value!.toString().split(
                              " ",
                            )[0],
                    ),

                    summaryItem(
                      "Jam",
                      controller.selectedTime.value.isEmpty
                          ? "-"
                          : "${controller.selectedTime.value} - selesai",
                    ),

                    const SizedBox(height: 10),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Harga"),
                        Text(
                          "Rp 50.000 / sesi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF6B4F3B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// BUTTON (SUDAH TANPA ICON)
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: controller.lanjutkan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B4F3B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Lanjutkan Pemesanan",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ITEM RINGKASAN
  Widget summaryItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(title), Text(value)],
      ),
    );
  }
}
