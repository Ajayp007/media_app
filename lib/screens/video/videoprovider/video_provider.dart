import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../videomodel/video_model.dart';

class VideoProvider with ChangeNotifier {
  int index = 0;
  List<VideoModel> videoList = [
    VideoModel(
        name: "Salaar: Part 1 – Ceasefire",
        image: "assets/song_img/salaar.jpg",
        song:
        "assets/video/salar.mp4"),
    VideoModel(
        name: "Kaithi",
        image: "assets/song_img/kaithi.jpg",
        song: "assets/video/kaithi.mp4"),
    VideoModel(
        name: "KGF Chapter 1",
        image: "assets/song_img/kgf1.jpg",
        song:
        "assets/video/kgf2.mp4"),
    VideoModel(
        name: "KGF Chapter 1",
        image: "assets/song_img/kgf1.jpg",
        song:
        "assets/video/kgfc2.mp4"),
  ];

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  void initVideo() {
    videoPlayerController = VideoPlayerController.asset("${videoList[index].song}");
    videoPlayerController!.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!, autoPlay: true);

  }

  void changeIndex(int i) {
    index = i;
    initVideo();
    notifyListeners();
  }
}
