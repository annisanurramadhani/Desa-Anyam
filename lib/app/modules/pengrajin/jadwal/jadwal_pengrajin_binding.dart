// jadwal_pengrajin_binding.dart

import 'package:get/get.dart';
import 'jadwal_pengrajin_controller.dart';

class JadwalPengrajinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalPengrajinController>(() => JadwalPengrajinController());
  }
}
