import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  List<String> videos = [
    "https://videos.pexels.com/video-files/852400/852400-sd_640_360_24fps.mp4",
    "https://videos.pexels.com/video-files/3890521/3890521-sd_640_360_25fps.mp4",
    "https://videos.pexels.com/video-files/5107014/5107014-sd_640_360_25fps.mp4",
    "https://videos.pexels.com/video-files/4971196/4971196-sd_640_360_25fps.mp4",
    "https://videos.pexels.com/video-files/4089576/4089576-sd_640_360_25fps.mp4",
  ];

  List<String> thumbnails = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQL-1bt0feoq3aJB5TLvqW--MdMCWEYiOUr_G_iE_Pgf7Mr8OsZ",
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQc8FCg2HEB9FAHvBhq9fakGgrttohjL-dzjjh3RO7Mn41JOrV_",
    "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ2moT3Dw1lwZgZT07UTlqiJRnMNoql8gxpXes-V-StmGlbC7la",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiKi27PF_dfCEXiHm_mZmGhvBGsuzoy2xbFClzOSY9rjo7HiDT",
    "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTIwqDiZk-2tpapCMWya2zFQxCVOfooctV61q-bCVQxLea-2J10",
  ];

  @override
  void initState() {
    super.initState();
    playNetworkVideo(videos[0]);
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  void playNetworkVideo(String url) {
    videoPlayerController?.dispose();
    chewieController?.dispose();

    videoPlayerController = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {
          chewieController = ChewieController(
            videoPlayerController: videoPlayerController!,
            autoPlay: true,
            looping: true,
          );
        });
      }).catchError((error) {
        print('Video player had error: $error');
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff004aad),
      body: Column(
        children: [
          videoPlayerController != null &&
                  videoPlayerController!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: videoPlayerController!.value.aspectRatio,
                  child: Chewie(
                    controller: chewieController!,
                  ),
                )
              : Center(child: CircularProgressIndicator()),
          // Text("Videos for you !"),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: videos.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                mainAxisExtent: 100,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    playNetworkVideo(videos[index]);
                  },
                  child: Image.network(
                    thumbnails[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
