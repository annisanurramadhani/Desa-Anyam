import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'detail_materi_controller.dart';

class DetailMateriView extends GetView<DetailMateriController> {
  const DetailMateriView({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments ?? {};

    return Scaffold(
      backgroundColor: const Color(0xFFF6F3EF),

      body: SafeArea(
        child: GetBuilder<DetailMateriController>(
          builder: (c) {
            if (!c.videoC.value.isInitialized) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView(
              padding: const EdgeInsets.all(20),
              children: [

                /// HEADER
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          data["title"] ?? "Materi",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9B6B43),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),

                const SizedBox(height: 6),

                Center(
                  child: Text(
                    data["subtitle"] ?? "",
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),

                const SizedBox(height: 20),

                /// ================= VIDEO =================
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [

                      /// VIDEO
                      AspectRatio(
                        aspectRatio: c.videoC.value.aspectRatio,
                        child: VideoPlayer(c.videoC),
                      ),

                      /// 🔥 GRADIENT (BIAR CINEMATIC)
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.4),
                                Colors.transparent,
                                Colors.black.withOpacity(0.5),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),

                      /// 🔥 PLAY BUTTON (SMOOTH)
                      Obx(() => GestureDetector(
                            onTap: c.togglePlay,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity: c.isPlaying.value ? 0 : 1,
                              child: Container(
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.6),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 45,
                                ),
                              ),
                            ),
                          )),

                      /// 🔥 PROGRESS BAR (LEBIH CLEAN)
                      Positioned(
                        bottom: 8,
                        left: 10,
                        right: 10,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: VideoProgressIndicator(
                            c.videoC,
                            allowScrubbing: true,
                            colors: const VideoProgressColors(
                              playedColor: Color(0xFF9B6B43),
                              bufferedColor: Colors.white30,
                              backgroundColor: Colors.white24,
                            ),
                          ),
                        ),
                      ),

                      /// 🔥 FLOATING GESTURE HINT (HALUS)
                      Positioned(
                        top: 12,
                        right: 12,
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: 0.8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              children: [
                                Text("✋ Pause",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11)),
                                SizedBox(width: 10),
                                Text("👍 Play",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 11)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔥 DESKRIPSI (LEBIH PREMIUM)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Text(
                    data["subtitle"] ??
                        "Materi ini menjelaskan teknik dasar anyaman.",
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}