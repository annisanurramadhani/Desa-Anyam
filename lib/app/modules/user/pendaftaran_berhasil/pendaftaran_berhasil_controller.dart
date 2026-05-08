import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class PendaftaranBerhasilController extends GetxController {
  void keDetailPesanan() {
    Get.toNamed(
      Routes.DETAIL_PESANAN,
      arguments: Get.arguments, // kirim data
    );
  }

  void keHome() {
    Get.offAllNamed(Routes.HOME);
  }

  void changeMenu(int index) {
    if (index == 0) {
      Get.toNamed(Routes.JADWAL_SAYA);
    } else if (index == 1) {
      Get.offAllNamed(Routes.HOME);
    } else if (index == 2) {
      Get.toNamed(Routes.PROFILE_USER);
    }
  }
}
