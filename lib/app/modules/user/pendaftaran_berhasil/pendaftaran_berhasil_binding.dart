import 'package:get/get.dart';
import 'pendaftaran_berhasil_controller.dart';

class PendaftaranBerhasilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PendaftaranBerhasilController>(
      () => PendaftaranBerhasilController(),
    );
  }
}