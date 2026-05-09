import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

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

  @override
  void onClose() {
    videoC.dispose();
    super.onClose();
  }
}