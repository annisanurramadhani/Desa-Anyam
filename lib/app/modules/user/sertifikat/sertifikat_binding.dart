import 'package:get/get.dart';
import 'sertifikat_controller.dart';

class SertifikatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SertifikatController>(() => SertifikatController());
  }
}