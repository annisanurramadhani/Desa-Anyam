// jadwal_pengrajin_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import 'jadwal_pengrajin_controller.dart';

class JadwalPengrajinView extends GetView<JadwalPengrajinController> {
  const JadwalPengrajinView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),

      bottomNavigationBar: Container(
        height: 75,

        decoration: const BoxDecoration(
          color: Colors.white,

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            // JADWAL
            InkWell(
              onTap: () {},

              borderRadius: BorderRadius.circular(20),

              child: SizedBox(
                width: 90,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: const [
                    Icon(
                      Icons.calendar_month,

                      color: Color(0xFFB87333),

                      size: 22,
                    ),

                    SizedBox(height: 4),

                    Text(
                      'Jadwal',

                      style: TextStyle(
                        color: Color(0xFFB87333),

                        fontWeight: FontWeight.bold,

                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // HOME
            InkWell(
              onTap: () {
                Get.toNamed('/home-pengrajin');
              },

              borderRadius: BorderRadius.circular(20),

              child: SizedBox(
                width: 90,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: const [
                    Icon(Icons.home_outlined, color: Colors.grey, size: 22),

                    SizedBox(height: 4),

                    Text(
                      'Beranda',

                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            // PROFIL
            InkWell(
              onTap: () {
                Get.toNamed('/profile-akun-pengrajin');
              },

              borderRadius: BorderRadius.circular(20),

              child: SizedBox(
                width: 90,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: const [
                    Icon(Icons.person_outline, size: 22),

                    SizedBox(height: 4),

                    Text('Profil', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

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
                        'Jadwal',

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

              const SizedBox(height: 22),

              // KALENDER
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(28),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),

                      blurRadius: 10,

                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Obx(
                  () => TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),

                    lastDay: DateTime.utc(2035, 12, 31),

                    focusedDay: controller.focusedDay.value,

                    selectedDayPredicate: (day) {
                      return isSameDay(controller.selectedDay.value, day);
                    },

                    onDaySelected: (selectedDay, focusedDay) {
                      controller.selectedDay.value = selectedDay;

                      controller.focusedDay.value = focusedDay;
                    },

                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,

                      titleCentered: true,

                      titleTextStyle: TextStyle(
                        fontSize: 17,

                        fontWeight: FontWeight.bold,

                        color: Color(0xFF2B0D0D),
                      ),
                    ),

                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.brown.shade200,

                        shape: BoxShape.circle,
                      ),

                      selectedDecoration: const BoxDecoration(
                        color: Color(0xFFB87333),

                        shape: BoxShape.circle,
                      ),

                      selectedTextStyle: const TextStyle(
                        color: Colors.white,

                        fontWeight: FontWeight.bold,
                      ),

                      todayTextStyle: const TextStyle(
                        color: Colors.white,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 22),

              Obx(
                () => Text(
                  'Jadwal ${controller.selectedDay.value.day}-${controller.selectedDay.value.month}-${controller.selectedDay.value.year}',

                  style: const TextStyle(
                    fontSize: 17,

                    fontWeight: FontWeight.bold,

                    color: Color(0xFF2B0D0D),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // INFO
              Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFF1E2D3),

                  borderRadius: BorderRadius.circular(22),
                ),

                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,

                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.calendar_month,

                        color: Color(0xFFB87333),

                        size: 24,
                      ),
                    ),

                    const SizedBox(width: 14),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text(
                            'Pengrajin hanya menerima\n1 murid per hari.',

                            style: TextStyle(
                              fontSize: 13,

                              height: 1.4,

                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 5),

                          Text(
                            'Pastikan jadwal tidak bentrok ya!',

                            style: TextStyle(
                              fontSize: 11,

                              height: 1.3,

                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // CARD JADWAL
              Container(
                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 14,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xFFD6E9FF),

                  borderRadius: BorderRadius.circular(22),
                ),

                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,

                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.person,

                        size: 26,

                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Obx(
                        () => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text(
                              controller.namaMurid.value,

                              style: const TextStyle(
                                fontSize: 14,

                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 2),

                            Text(
                              controller.kelas.value,

                              style: const TextStyle(fontSize: 12, height: 1.2),
                            ),

                            const SizedBox(height: 5),

                            Row(
                              children: [
                                const Icon(
                                  Icons.access_time,

                                  size: 12,

                                  color: Colors.black54,
                                ),

                                const SizedBox(width: 5),

                                Text(
                                  controller.waktu.value,

                                  style: const TextStyle(
                                    fontSize: 11,

                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
