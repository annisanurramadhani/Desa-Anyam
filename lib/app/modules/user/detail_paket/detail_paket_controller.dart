import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class DetailPaketController extends GetxController {

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

  void gantiPengajar() {
    Get.snackbar('Info', 'Pilih pengajar lain');
  }

  void lanjutkan() {
    Get.snackbar('Info', 'Lanjut ke pembayaran');
  }
}