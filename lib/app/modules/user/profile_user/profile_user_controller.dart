import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class ProfileUserController extends GetxController {
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

  void goToEdit() {
    Get.toNamed(Routes.EDIT_PROFILE);
  }

  void goToSertifikat() {
    Get.toNamed(Routes.SERTIFIKAT);
  }

  /// 🔥 TAMBAHAN INI
  void goToPesanan() {
    Get.toNamed(Routes.DETAIL_PESANAN);
  }

  void goToRiwayatAktivitas() {
    Get.toNamed('/riwayat-aktivitas');
  }

  void logout() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
