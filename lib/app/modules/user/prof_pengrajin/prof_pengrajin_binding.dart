import 'package:get/get.dart';
import 'prof_pengrajin_controller.dart';

class ProfPengrajinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfPengrajinController>(() => ProfPengrajinController());
  }
}