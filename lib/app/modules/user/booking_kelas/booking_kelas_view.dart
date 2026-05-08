import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'booking_kelas_controller.dart';

class BookingKelasView extends GetView<BookingKelasController> {
  const BookingKelasView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      body: SafeArea(
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
                        "Booking Kelas",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                style: TextStyle(fontWeight: FontWeight.bold),
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
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.selectedDate.value == null
                              ? "Pilih tanggal"
                              : controller.selectedDate.value!
                                  .toString()
                                  .split(" ")[0],
                        ),
                        const Icon(Icons.calendar_today, size: 16),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// PILIH JAM
              const Text(
                "Pilih Jam",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Wrap(
                spacing: 10,
                children: ["08:00", "10:00", "13:00", "15:00"].map((time) {
                  return Obx(
                    () => ChoiceChip(
                      label: Text(time),
                      selected: controller.selectedTime.value == time,
                      selectedColor: const Color(0xFF9B6B43),
                      labelStyle: TextStyle(
                        color: controller.selectedTime.value == time
                            ? Colors.white
                            : Colors.black,
                      ),
                      onSelected: (_) => controller.pickTime(time),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              /// HARGA
              const Text(
                "Rp 50.000 / sesi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              const Spacer(),

              /// BUTTON 🔥 FIX TOTAL
              SizedBox(
                width: double.infinity,
                height: 55, // 🔥 lebih besar
                child: ElevatedButton(
                  onPressed: controller.lanjutkan,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9B6B43), // ✅ sama persis
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 3,
                  ),
                  child: const Text(
                    "Lanjutkan Pemesanan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}