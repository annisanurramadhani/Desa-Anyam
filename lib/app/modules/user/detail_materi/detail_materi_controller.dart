import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../routes/app_routes.dart';

class DetailMateriController extends GetxController {
  late VideoPlayerController videoC;
  var isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();

    final data = Get.arguments ?? {};
    final video = data["video"];

    print("VIDEO PATH: $video"); // 🔥 DEBUG

    if (video == null || video == "") {
      print("❌ VIDEO KOSONG");
      return;
    }

    videoC = VideoPlayerController.asset(video)
      ..initialize().then((_) {
        update();
      });
  }

  void togglePlay() {
    if (videoC.value.isPlaying) {
      videoC.pause();
      isPlaying.value = false;
    } else {
      videoC.play();
      isPlaying.value = true;
    }
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

  @override
  void onClose() {
    videoC.dispose();
    super.onClose();
  }
}