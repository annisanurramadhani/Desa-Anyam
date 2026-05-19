import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class HomeController extends GetxController {

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

  void goToNotification() {
    Get.toNamed(Routes.NOTIFIKASI); 
  }

  void goToBelajar() {
    Get.toNamed(Routes.BELAJAR_ANYAMAN);
  }

  void goToPengrajin() {
    Get.toNamed(Routes.PROF_PENGRAJIN);
  }

  void goToProduk() {
    Get.toNamed(Routes.PRODUK_ANYAMAN);
  }

  void goToJadwal() {
    Get.toNamed(Routes.JADWAL_SAYA); 
  }
}