import 'package:get/get.dart';
import 'detail_pesanan_controller.dart';

class DetailPesananBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPesananController>(
        () => DetailPesananController());
  }
}