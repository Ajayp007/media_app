import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_app/screens/home/model/home_model.dart';

class HomeProvider with ChangeNotifier {
  int indiIndex = 0;
  bool playButton = false;
  double indicator = 0.0;
  Duration totalDuration = const Duration(seconds: 0);

  List<HomeModel> musicList = [
    HomeModel(
        name: "Badass",
        image: "assets/song_img/leo.jpg",
        song:
            "https://pagalfree.com/musics/128-Badass - Leo (Hindi) 128 Kbps.mp3"),
    HomeModel(
        name: "Kesariya",
        image: "assets/song_img/brahmashtra.jpg",
        song:
            "https://pagalfree.com/musics/128-Kesariya - Brahmastra 128 Kbps.mp3"),
    HomeModel(
        name: "The Monster Song",
        image: "assets/song_img/kgf1.jpg",
        song:
            "https://pagalfree.com/musics/128-The Monster Song - KGF Chapter 2 128 Kbps.mp3"),
    HomeModel(
        name: "Galliyan Returns",
        image: "assets/song_img/ek villain.webp",
        song:
            "https://pagalfree.com/musics/128-Galliyan Returns - Ek Villain Returns 128 Kbps.mp3"),
    HomeModel(
        name: "Deva Shree Ganesha",
        image: "assets/song_img/agneepath.jpg",
        song:
            "https://pagalfree.com/musics/128-Deva Shree Ganesha - Agneepath 128 Kbps.mp3"),
    HomeModel(
        name: "Abrars Entry",
        image: "assets/song_img/animal.jpg",
        song:
            "https://pagalfree.com/musics/128-Abrars Entry Jamal Kudu - Animal 128 Kbps.mp3"),
    HomeModel(
        name: "Mashallah - Ek Tha Tiger",
        image: "assets/song_img/ek tha tiger.jpg",
        song:
            "https://pagalfree.com/musics/128-Mashallah - Ek Tha Tiger 128 Kbps.mp3"),
  ];

  void changeIndex(int index) {
    indiIndex = index;
    notifyListeners();
  }

  void changeButton(bool play) {
    playButton =!playButton;
    notifyListeners();
  }

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  initChange() {
    assetsAudioPlayer.open(
      Playlist(
          audios: musicList.map((e) => Audio.network(e.song!)).toList(),
          startIndex: indiIndex),
      showNotification: true,
      autoStart: false,
    );
  }
}
