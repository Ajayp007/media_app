import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_app/screens/audio/audiomodel/audio_model.dart';

class AudioProvider with ChangeNotifier {
  int indiIndex = 0;
  bool playButton = false;
  double indicator = 0.0;
  Duration totalDuration = const Duration(seconds: 0);
  Duration liveDuration = const Duration(seconds: 0);
  int hour = 0, minute = 0, second = 0;

  List<AudioModel> musicList = [
    AudioModel(
        name: "Badass",
        image: "assets/song_img/leo.jpg",
        song:
            "https://pagalfree.com/musics/128-Badass - Leo (Hindi) 128 Kbps.mp3"),
    AudioModel(
        name: "Kesariya",
        image: "assets/song_img/brahmashtra.jpg",
        song:
            "https://pagalfree.com/musics/128-Kesariya - Brahmastra 128 Kbps.mp3"),
    AudioModel(
        name: "The Monster Song",
        image: "assets/song_img/kgf1.jpg",
        song:
            "https://pagalfree.com/musics/128-The Monster Song - KGF Chapter 2 128 Kbps.mp3"),
    AudioModel(
        name: "Galliyan Returns",
        image: "assets/song_img/ek villain.webp",
        song:
            "https://pagalfree.com/musics/128-Galliyan Returns - Ek Villain Returns 128 Kbps.mp3"),
    AudioModel(
        name: "Deva Shree Ganesha",
        image: "assets/song_img/agneepath.jpg",
        song:
            "https://pagalfree.com/musics/128-Deva Shree Ganesha - Agneepath 128 Kbps.mp3"),
    AudioModel(
        name: "Abrars Entry Jamal Kudu",
        image: "assets/song_img/animal.jpg",
        song:
            "https://pagalfree.com/musics/128-Abrars Entry Jamal Kudu - Animal 128 Kbps.mp3"),
    AudioModel(
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

  void currentDuration() {
    assetsAudioPlayer.current.listen(
      (event) {
        totalDuration = event!.audio.duration;

        if (totalDuration.inSeconds >= 60) {
          second = totalDuration.inSeconds;
          minute = second ~/ 60;
          second = second - (minute * 60);

          if (minute >= 60) {
            hour = minute ~/ 60;
            minute = minute - (hour * 60);
          }
        }

        notifyListeners();
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
  }
}
