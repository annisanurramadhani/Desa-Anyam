import 'package:get/get.dart';
import 'pembayaran_controller.dart';

class PembayaranBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PembayaranController>(() => PembayaranController());
  }
}