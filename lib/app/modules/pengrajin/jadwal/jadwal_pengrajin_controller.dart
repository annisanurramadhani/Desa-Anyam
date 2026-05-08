import 'package:get/get.dart';

class JadwalPengrajinController extends GetxController {
  Rx<DateTime> focusedDay = DateTime.now().obs;

  Rx<DateTime> selectedDay = DateTime.now().obs;

  RxString namaMurid = 'Soleh'.obs;

  RxString kelas = 'Anyaman Bambu'.obs;

  RxString waktu = '09.00 WIB'.obs;

  void pilihTanggal(DateTime tanggal) {
    selectedDay.value = tanggal;

    focusedDay.value = tanggal;
  }
}
