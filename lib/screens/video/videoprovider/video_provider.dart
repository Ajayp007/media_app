import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../videomodel/video_model.dart';

class VideoProvider with ChangeNotifier {
  int index = 0;
  List<VideoModel> videoList = [
    VideoModel(
        name: "Salaar",
        image: "assets/song_img/salaar.jpg",
        song:
        "assets/video/K.G.F_-_The_Monster___KGF_Vs_Salaar_[_4k_edit_](720p)[1].mp4"),
    VideoModel(
        name: "Kaithi",
        image: "assets/song_img/kaithi.jpg",
        song: "assets/video/KAITHI_-_DILLI_edit_ft._ROLEX(1080p)[1].mp4"),
    VideoModel(
        name: "KGF",
        image: "assets/song_img/kgf1.jpg",
        song:
        "assets/video/Kgf_2_Full_Screen_Status_🔥___Rocky_Bhai_Full_Screen_Status___Assembly_Status__(1080p)[1].mp4"),
    VideoModel(
        name: "Rockey",
        image: "assets/song_img/kgf1.jpg",
        song:
        "assets/video/Rocky_Entry___K.G.F_Chapter_2___Full_Attitude😎(480p)[1].mp4"),
  ];
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  void initVideo() {
    videoPlayerController = VideoPlayerController.asset("${videoList[index]}");
    videoPlayerController!.initialize();
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController!, autoPlay: false);
  }

  void changeIndex(int i) {
    index = i;
    initVideo();
    notifyListeners();
  }
}
