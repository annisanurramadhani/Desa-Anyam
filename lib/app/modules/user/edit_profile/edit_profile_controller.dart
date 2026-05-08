import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../routes/app_routes.dart';

class EditProfileController extends GetxController {

  var imageFile = Rx<File?>(null);
  final picker = ImagePicker();

  // PICK IMAGE
  Future<void> pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      imageFile.value = File(picked.path);
    }
  }

  // NAVIGATION
  void changeMenu(int index) {
    if (index == 0) {
      Get.toNamed(Routes.JADWAL_SAYA);
    }

    if (index == 1) {
      Get.offAllNamed(Routes.HOME);
    }

    if (index == 2) {
      Get.toNamed(Routes.PROFILE_USER);
    }
  }

  void simpan() {
    Get.snackbar('Berhasil', 'Profil berhasil diperbarui');
    Get.back();
  }
}