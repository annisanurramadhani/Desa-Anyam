import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class FormPendaftaranController extends GetxController {

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

  void goToPembayaran() {
    Get.toNamed(Routes.PEMBAYARAN); // ✅ juga dirapihin
  }
}