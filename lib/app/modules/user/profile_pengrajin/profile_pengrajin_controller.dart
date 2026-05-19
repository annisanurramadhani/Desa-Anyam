import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../routes/app_routes.dart';

class ProfilePengrajinController extends GetxController {

  /// 🔥 DATA DARI HALAMAN SEBELUMNYA
  late Map data;

  /// 🔥 NOMOR WA (bisa nanti dari database)
  final String noWa = "6281234567890";

  @override
  void onInit() {
    super.onInit();

    /// 🔥 AMBIL ARGUMENT
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

  /// 🔥 KE BOOKING
  void goToBooking() {
    Get.toNamed(
      Routes.BOOKING_KELAS,
      arguments: data, // 🔥 biar data pengrajin ikut kebawa
    );
  }

  /// 🔥 WHATSAPP DINAMIS
  void openWhatsapp() async {
    final String nama = data["name"] ?? "Pengrajin";

    final url =
        "https://wa.me/$noWa?text=Halo%20$nama,%20saya%20ingin%20tanya%20kelas%20anyaman";

    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar("Error", "Tidak bisa membuka WhatsApp");
    }
  }
}