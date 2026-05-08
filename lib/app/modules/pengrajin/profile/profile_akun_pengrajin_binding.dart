// profile_akun_pengrajin_binding.dart

import 'package:get/get.dart';
import 'profile_akun_pengrajin_controller.dart';

class ProfileAkunPengrajinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileAkunPengrajinController>(
      () => ProfileAkunPengrajinController(),
    );
  }
}
