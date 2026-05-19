import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class SertifikatController extends GetxController {

  /// 🔥 STATE (kalau nanti ada sertifikat)
  var hasCertificate = false.obs;

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