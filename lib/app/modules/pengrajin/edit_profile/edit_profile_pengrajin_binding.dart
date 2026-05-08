// edit_profile_pengrajin_binding.dart

import 'package:get/get.dart';
import 'edit_profile_pengrajin_controller.dart';

class EditProfilePengrajinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfilePengrajinController>(
      () => EditProfilePengrajinController(),
    );
  }
}
