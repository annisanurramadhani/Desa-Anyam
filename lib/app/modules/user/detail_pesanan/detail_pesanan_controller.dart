import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class DetailPesananController extends GetxController {
  late Map<String, dynamic> data;

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments ?? {};
  }

  void goToHome() {
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