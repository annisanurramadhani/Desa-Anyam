import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class DetailPengrajinController extends GetxController {

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

  void goToBooking() {
    Get.toNamed(Routes.BOOKING_KELAS); // ✅ fix route
  }
}