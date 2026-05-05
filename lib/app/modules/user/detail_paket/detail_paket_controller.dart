import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class DetailPaketController extends GetxController {

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

  void gantiPengajar() {
    Get.snackbar('Info', 'Pilih pengajar lain');
  }

  void lanjutkan() {
    Get.snackbar('Info', 'Lanjut ke pembayaran');
  }
}