import 'package:get/get.dart';
import '../../../routes/app_routes.dart';


class RiwayatAktivitasController extends GetxController {

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

  var riwayatList = [
    {
      "kelas": "Anyaman Bambu Dasar",
      "pengrajin": "Pak Tarjo",
      "tanggal": "12 Mei 2026",
      "jam": "09:00",
      "lokasi": "Balai Desa Dukuhsembung",
      "status": "Selesai"
    },
    
  ].obs;

}