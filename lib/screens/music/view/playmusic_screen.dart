import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../musicprovider/music_provider.dart';

class PlayMusicScreen extends StatefulWidget {
  const PlayMusicScreen({super.key});

  @override
  State<PlayMusicScreen> createState() => _PlayMusicScreenState();
}

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MusicProvider>().playButton = false;
    context.read<MusicProvider>().initChange();
    context.read<MusicProvider>().totalTime();
    context.read<MusicProvider>().shawLiveDuration();
  }

  MusicProvider? providerR;
  MusicProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();

    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text("${providerW!.musicList[index].name}"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 350,
            margin: const EdgeInsets.all(30),
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage(
                    "${providerW!.musicList[index].image}",
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "${providerW!.musicList[index].name}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "${providerW!.liveDuration.inMinutes}:${providerW!.liveDuration.inSeconds}"),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.75,
                  child: Slider(
                    value: providerW!.liveDuration.inSeconds.toDouble(),
                    onChanged: (value) {
                      providerW!.assetsAudioPlayer
                          .seek(Duration(seconds: value.toInt()));
                    },
                    max: providerW!.totalDuration.inSeconds.toDouble(),
                  ),
                ),
                Text("${providerW!.minute}:${providerW!.second}"),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shuffle,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  providerW!.assetsAudioPlayer.previous();

                  providerW!.playButton = false;
                  providerR!.changeButton();
                },
                icon: const Icon(
                  Icons.skip_previous_rounded,
                  size: 30,
                ),
              ),
              IconButton.filled(
                onPressed: () {
                  if (providerW!.playButton) {
                    providerW!.assetsAudioPlayer.pause();
                    providerR!.changeButton();
                  } else {
                    providerW!.assetsAudioPlayer.play();
                    providerR!.changeButton();
                  }
                },
                icon: providerR!.playButton
                    ? const Icon(
                        Icons.pause_circle_outline,
                        size: 40,
                      )
                    : const Icon(
                        Icons.play_circle_outline,
                        size: 40,
                      ),
              ),
              IconButton(
                onPressed: () {
                  providerW!.assetsAudioPlayer.next();
                  providerW!.playButton = false;
                  providerR!.changeButton();
                },
                icon: const Icon(
                  Icons.skip_next_rounded,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.loop,
                  size: 30,
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.favorite_border_outlined),
              const SizedBox(
                width: 30,
              ),
              const Icon(Icons.delete_outline_outlined),
              const SizedBox(
                width: 30,
              ),
              const Icon(Icons.share),
              const SizedBox(
                width: 30,
              ),
              PopupMenuButton(
                itemBuilder: (context) {
                  return [];
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
