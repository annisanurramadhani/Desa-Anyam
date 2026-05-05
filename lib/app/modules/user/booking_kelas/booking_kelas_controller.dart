import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class BookingKelasController extends GetxController {
  var selectedIndex = (-1).obs;

  void selectPaket(int index) {
    selectedIndex.value = index;
  }

  void changeMenu(int index) {
    if (index == 0) {
      Get.toNamed(Routes.JADWAL_SAYA); // ✅ jadwal
    }

    if (index == 1) {
      Get.offAllNamed(Routes.HOME); // ✅ home
    }

    if (index == 2) {
      Get.toNamed(Routes.PROFILE_USER); // ✅ profile
    }
  }

  void lanjutkan() {
    Get.snackbar('Info', 'Lanjut ke pembayaran');
  }
}