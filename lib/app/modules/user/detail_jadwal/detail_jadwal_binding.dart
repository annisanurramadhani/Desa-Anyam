import 'package:get/get.dart';
import 'detail_jadwal_controller.dart';

class DetailJadwalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailJadwalController>(
      () => DetailJadwalController(),
    );
  }
}