import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class JadwalSayaController extends GetxController {

  var jadwalList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();

    /// 🔥 DATA DUMMY (BISA DIGANTI API)
    jadwalList.value = [
      {
        "tanggal": "06 April 2026",
        "jam": "09:00",
        "lokasi": "Balaidesa Dukuhsembung",
        "harga": "50.000",
        "status": "Belum Lunas"
      },
      {
        "tanggal": "15 Maret 2026",
        "jam": "09:00",
        "lokasi": "Balaidesa Dukuhsembung",
        "harga": "50.000",
        "status": "Lunas"
      },
      {
        "tanggal": "20 April 2026",
        "jam": "09:00",
        "lokasi": "Balaidesa Dukuhsembung",
        "harga": "50.000",
        "status": "Belum Lunas"
      },
    ];
  }

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
}