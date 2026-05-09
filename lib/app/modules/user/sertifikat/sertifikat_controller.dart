import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class SertifikatController extends GetxController {

  /// 🔥 STATE (kalau nanti ada sertifikat)
  var hasCertificate = false.obs;

  void changeMenu(int index) {
    switch (index) {
      case 0:
        Get.toNamed(Routes.JADWAL_SAYA);
        break;

      case 1:
        Get.offAllNamed(Routes.HOME);
        break;

      case 2:
        Get.toNamed(Routes.PROFILE_USER);
        break;
    }
  }

  /// 🔥 DOWNLOAD
  void download() {
    if (!hasCertificate.value) {
      Get.snackbar(
        'Info',
        'Belum ada sertifikat yang bisa diunduh',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    Get.snackbar(
      'Berhasil',
      'Sertifikat berhasil diunduh',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}