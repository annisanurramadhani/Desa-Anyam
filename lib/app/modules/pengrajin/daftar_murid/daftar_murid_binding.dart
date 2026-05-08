// daftar_murid_binding.dart

import 'package:get/get.dart';
import 'daftar_murid_controller.dart';

class DaftarMuridBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarMuridController>(() => DaftarMuridController());
  }
}
