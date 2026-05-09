import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class PendaftaranBerhasilController extends GetxController {

  /// 🔥 AMBIL DATA DARI HALAMAN SEBELUMNYA
  late Map<String, dynamic> data;

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments ?? {};
  }

  /// 🔥 KE DETAIL PESANAN
  void keDetailPesanan() {
    Get.toNamed(
      Routes.DETAIL_PESANAN,
      arguments: data,
    );
  }

  /// 🔥 KE HOME
  void keHome() {
    Get.offAllNamed(Routes.HOME);
  }

  /// 🔥 BOTTOM NAV
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
}