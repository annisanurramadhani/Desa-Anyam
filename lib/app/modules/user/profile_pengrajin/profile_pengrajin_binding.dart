import 'package:get/get.dart';
import 'profile_pengrajin_controller.dart';

class ProfilePengrajinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilePengrajinController>(
      () => ProfilePengrajinController(),
    );
  }
}