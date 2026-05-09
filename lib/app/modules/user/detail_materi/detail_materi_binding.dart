import 'package:get/get.dart';
import 'detail_materi_controller.dart';

class DetailMateriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMateriController>(() => DetailMateriController());
  }
}