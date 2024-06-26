import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../musicmodel/music_model.dart';


class MusicProvider with ChangeNotifier {
  int indiIndex = 0;
  bool playButton = false;
  double indicator = 0.0;
  Duration totalDuration = const Duration();
  Duration liveDuration = const Duration();
  int hour = 0, minute = 0, second = 0;

  List<MusicModel> musicList = [
    MusicModel(
        name: "Badass",
        image: "assets/song_img/leo.jpg",
        song:
            "https://pagalfree.com/musics/128-Badass - Leo (Hindi) 128 Kbps.mp3"),
    MusicModel(
        name: "Kesariya",
        image: "assets/song_img/brahmashtra.jpg",
        song:
            "https://pagalfree.com/musics/128-Kesariya - Brahmastra 128 Kbps.mp3"),
    MusicModel(
        name: "The Monster Song",
        image: "assets/song_img/kgf1.jpg",
        song:
            "https://pagalfree.com/musics/128-The Monster Song - KGF Chapter 2 128 Kbps.mp3"),
    MusicModel(
        name: "Galliyan Returns",
        image: "assets/song_img/ek villain.webp",
        song:
            "https://pagalfree.com/musics/128-Galliyan Returns - Ek Villain Returns 128 Kbps.mp3"),
    MusicModel(
        name: "Deva Shree Ganesha",
        image: "assets/song_img/agneepath.jpg",
        song:
            "https://pagalfree.com/musics/128-Deva Shree Ganesha - Agneepath 128 Kbps.mp3"),
    MusicModel(
        name: "Abrars Entry Jamal Kudu",
        image: "assets/song_img/animal.jpg",
        song:
            "https://pagalfree.com/musics/128-Abrars Entry Jamal Kudu - Animal 128 Kbps.mp3"),
    MusicModel(
        name: "Mashallah - Ek Tha Tiger",
        image: "assets/song_img/ek tha tiger.jpg",
        song:
            "https://pagalfree.com/musics/128-Mashallah - Ek Tha Tiger 128 Kbps.mp3"),
  ];

  void changeIndex(int index) {
    indiIndex = index;
    notifyListeners();
  }

  void changeButton() {
    playButton = !playButton;
    notifyListeners();
  }

  void totalTime() {
    assetsAudioPlayer.current.listen(
      (event) {
        totalDuration = event!.audio.duration;
        notifyListeners();
      },
    );
  }

  void currentTime() {
    assetsAudioPlayer.current.listen(
      (event) {
       if(event != null)
         {
           totalDuration = event.audio.duration;
           second = totalDuration.inSeconds;
           if (second >= 60) {
             minute = second ~/ 60;
             second = second - (minute * 60);

             if (minute >= 60) {
               hour = minute ~/ 60;
               minute = minute - (hour * 60);
             }
           }
           notifyListeners();
         }
      },
    );
  }

  void shawLiveDuration() {
    assetsAudioPlayer.currentPosition.listen(
      (event) {
        liveDuration = event;
        notifyListeners();
      },
    );
  }

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  Future<void> initChange() async {
    await assetsAudioPlayer.open(
      Playlist(
          audios: musicList.map((e) => Audio.network(e.song!)).toList(),
          startIndex: indiIndex),
      showNotification: true,
      autoStart: false,
    );
    currentTime();
  }
}
