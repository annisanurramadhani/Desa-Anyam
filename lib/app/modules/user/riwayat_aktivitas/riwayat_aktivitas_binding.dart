import 'package:get/get.dart';
import 'riwayat_aktivitas_controller.dart';

class RiwayatAktivitasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatAktivitasController>(
      () => RiwayatAktivitasController(),
    );
  }
}