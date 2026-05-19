import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class PembayaranController extends GetxController {
  var selectedMethod = (-1).obs; // ✅ FIX

  late Map<String, dynamic> data;

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments ?? {};
  }

  /// 🔥 NAVIGASI BOTTOM
  void changeMenu(int index) {
    if (index == 0) {
      Get.toNamed(Routes.JADWAL_SAYA);
    } else if (index == 1) {
      Get.offAllNamed(Routes.HOME);
    } else if (index == 2) {
      Get.toNamed(Routes.PROFILE_USER);
    }
  }

  void selectMethod(int index) {
    selectedMethod.value = index;
  }

  int get totalHarga {
    return data["harga"] ?? 0;
  }

  void bayar() {
    if (selectedMethod.value == -1) {
      Get.snackbar("Error", "Pilih metode pembayaran dulu");
      return;
    }

    Get.offAllNamed(
      Routes.PENDAFTARAN_BERHASIL,
      arguments: data, // 🔥 biar lanjut ke detail
    );
  }
}