import 'package:get/get.dart';
import 'detail_produk_controller.dart';

class DetailProdukBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProdukController>(
      () => DetailProdukController(),
    );
  }
}