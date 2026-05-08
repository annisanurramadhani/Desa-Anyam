import 'package:get/get.dart';

class BookingKelasController extends GetxController {
  var selectedDate = Rxn<DateTime>();
  var selectedTime = ''.obs;

  void pickDate(DateTime date) {
    selectedDate.value = date;
  }

  void pickTime(String time) {
    selectedTime.value = time;
  }

  void lanjutkan() {
    if (selectedDate.value == null || selectedTime.value.isEmpty) {
      Get.snackbar("Error", "Pilih tanggal dan jam dulu");
      return;
    }

    Get.toNamed('/form-pendaftaran');
  }
}