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
            /// LOADING VIDEO
            if (!c.videoC.value.isInitialized) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView(
              padding: const EdgeInsets.all(20),
              children: [

                /// ================= HEADER =================
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
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),

                const SizedBox(height: 8),

                /// SUBTITLE
                Center(
                  child: Text(
                    data["subtitle"] ?? "",
                    style: const TextStyle(color: Colors.black54),
                  ),
                ),

                const SizedBox(height: 20),

                /// ================= VIDEO =================
                Stack(
                  children: [

                    /// VIDEO
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: AspectRatio(
                        aspectRatio: c.videoC.value.aspectRatio,
                        child: VideoPlayer(c.videoC),
                      ),
                    ),

                    /// GRADIENT ATAS
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(20)),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black.withOpacity(0.6),
                              Colors.transparent
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),

                    /// PLAY BUTTON (AUTO HIDE)
                    Positioned.fill(
                      child: Center(
                        child: Obx(() => GestureDetector(
                              onTap: c.togglePlay,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: c.isPlaying.value ? 0 : 1,
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                    color: Colors.black54,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ),

                    /// PROGRESS BAR
                    Positioned(
                      bottom: 10,
                      left: 10,
                      right: 10,
                      child: VideoProgressIndicator(
                        c.videoC,
                        allowScrubbing: true,
                        colors: const VideoProgressColors(
                          playedColor: Color(0xFF6B4F3B),
                          bufferedColor: Colors.white54,
                          backgroundColor: Colors.white30,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// ================= DESKRIPSI =================
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    data["subtitle"] ??
                        "Materi ini menjelaskan teknik dasar anyaman.",
                    style: const TextStyle(fontSize: 13),
                  ),
                ),

                const SizedBox(height: 20),

                /// ================= INFO GESTURE =================
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE7EFE5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.pan_tool, color: Colors.green),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "✋ Buka tangan = Pause\n👍 Jempol = Play",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}