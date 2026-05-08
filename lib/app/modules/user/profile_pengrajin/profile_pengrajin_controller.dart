import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../routes/app_routes.dart';

class ProfilePengrajinController extends GetxController {

  final String noWa = "6281234567890"; // 🔥 ganti nomor pengrajin

  void changeMenu(int index) {
    if (index == 0) {
      Get.toNamed(Routes.JADWAL_SAYA);
    } else if (index == 1) {
      Get.offAllNamed(Routes.HOME);
    } else if (index == 2) {
      Get.toNamed(Routes.PROFILE_USER);
    }
  }

  void goToBooking() {
    Get.toNamed(Routes.BOOKING_KELAS);
  }

  /// 🔥 WHATSAPP
  void openWhatsapp() async {
    final url = "https://wa.me/$noWa?text=Halo%20Pak%20Tarjo%2C%20saya%20ingin%20tanya%20kelas%20anyaman";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      Get.snackbar("Error", "Tidak bisa membuka WhatsApp");
    }
  }
}