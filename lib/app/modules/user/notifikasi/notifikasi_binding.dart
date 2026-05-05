import 'package:get/get.dart';
import 'notifikasi_controller.dart';

class NotifikasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotifikasiController>(() => NotifikasiController());
  }
}