import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class PendaftaranBerhasilController extends GetxController {

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

  void goToDetailPesanan() {
    Get.toNamed(Routes.DETAIL_PESANAN); // ✅ fix
  }

  void goToHome() {
    Get.offAllNamed(Routes.HOME); // ✅ fix
  }
}