// home_pengrajin_controller.dart

import 'package:get/get.dart';

class HomePengrajinController extends GetxController {
  // DATA USER
  RxString nama = 'Pak Tono'.obs;

  // DATA DASHBOARD
  RxInt rating = 5.obs;
  RxInt ulasan = 11.obs;
  RxInt jumlahMurid = 10.obs;
  RxInt jumlahKelas = 10.obs;

  // JADWAL
  RxString jadwalNama = 'Soleh'.obs;
  RxString jadwalWaktu = 'Senin, 09.00 WIB'.obs;

  @override
  void onInit() {
    super.onInit();

    loadData();
  }

  void loadData() {
    // nanti bisa ambil dari API Flask

    /*
    contoh:

    nama.value = response['user']['username'];

    */
  }

  void logout() {
    Get.offAllNamed('/login');
  }
}
