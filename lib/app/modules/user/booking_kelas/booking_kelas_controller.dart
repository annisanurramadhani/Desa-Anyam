import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class BookingKelasController extends GetxController {
  /// 🔥 DATA DARI HALAMAN SEBELUMNYA
  var data = Get.arguments ?? {};

  /// 🔥 STATE
  var selectedDate = Rxn<DateTime>();
  var selectedTime = "".obs;

  /// 🔥 PILIH TANGGAL
  void pickDate(DateTime date) {
    selectedDate.value = date;
  }

  /// 🔥 PILIH JAM
  void pickTime(String time) {
    selectedTime.value = time;
  }

  /// 🔥 NAVIGASI BOTTOM
  void changeMenu(int index) {
    if (index == 0) {
      Get.toNamed(Routes.JADWAL_SAYA);
    } else if (index == 1) {
      Get.offAllNamed(Routes.HOME);
    } else if (index == 2) {
      Get.toNamed(Routes.PROFILE_USER);
    }
  }

  /// 🔥 LANJUTKAN PESANAN (INI YANG PENTING)
  void lanjutkan() {
    if (selectedDate.value == null) {
      Get.snackbar("Error", "Pilih tanggal dulu");
      return;
    }

    if (selectedTime.value.isEmpty) {
      Get.snackbar("Error", "Pilih jam dulu");
      return;
    }

    Get.toNamed(
      Routes.FORM_PENDAFTARAN,
      arguments: {
        "pengrajin": data["name"] ?? "Pak Tarjo",
        "kelas": "Pengrajin Anyaman Bambu",
        "tanggal": selectedDate.value!.toString().split(" ")[0],
        "jam": selectedTime.value,
        "lokasi": "Balaidesa Dukuhsembung",
        "harga": "50000",
      },
    );
  }
}