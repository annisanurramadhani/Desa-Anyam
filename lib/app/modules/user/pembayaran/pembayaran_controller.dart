import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class PembayaranController extends GetxController {
  var selectedMethod = 0.obs;

  // ✅ DATA DARI HALAMAN SEBELUMNYA
  late Map<String, dynamic> data;

  @override
  void onInit() {
    super.onInit();
    data = Get.arguments ?? {};
  }

  // ✅ BOTTOM NAVIGATION
  void changeMenu(int index) {
    if (index == 0) {
      Get.toNamed(Routes.JADWAL_SAYA);
    } else if (index == 1) {
      Get.offAllNamed(Routes.HOME);
    } else if (index == 2) {
      Get.toNamed(Routes.PROFILE_USER);
    }
  }

  // ✅ PILIH METODE PEMBAYARAN
  void selectMethod(int index) {
    selectedMethod.value = index;
  }

  // ✅ TOTAL HARGA (AMAN DARI NULL)
  int get totalHarga {
    return data["harga"] ?? 0;
  }

  // ✅ BUTTON BAYAR (FINAL)
  void bayar() {
    if (selectedMethod.value == -1) {
      Get.snackbar("Error", "Pilih metode pembayaran dulu");
      return;
    }

    // 🔥 PINDAH KE HALAMAN BERHASIL
    Get.offAllNamed(Routes.PENDAFTARAN_BERHASIL);
  }
}