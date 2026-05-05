import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class PembayaranController extends GetxController {
  var selectedMethod = 0.obs;

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

  void selectMethod(int index) {
    selectedMethod.value = index;
  }

  void lanjutPembayaran() {
    Get.snackbar("Info", "Lanjut ke proses pembayaran");
  }
}