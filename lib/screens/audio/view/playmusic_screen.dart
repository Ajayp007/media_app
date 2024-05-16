import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../audioprovider/audio_provider.dart';

class PlayMusicScreen extends StatefulWidget {
  const PlayMusicScreen({super.key});

  @override
  State<PlayMusicScreen> createState() => _PlayMusicScreenState();
}

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AudioProvider>().initChange();
    context.read<AudioProvider>().totalTime();
    context.read<AudioProvider>().shawLiveDuration();
  }

  AudioProvider? providerR;
  AudioProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<AudioProvider>();
    providerW = context.watch<AudioProvider>();

    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text("${providerW!.musicList[index].name}"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 300,
            margin: const EdgeInsets.all(30),
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black,
              image: DecorationImage(
                  image: AssetImage("${providerW!.musicList[index].image}"),
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
          const Spacer(),
          Slider(
            value: 1,
            onChanged: (value) {},
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text("${providerW!.liveDuration.inHours}:${providerW!.liveDuration.inMinutes}:${providerW!.liveDuration.inSeconds}"),
                Text(
                    "${providerW!.totalDuration.inHours}:${providerW!.totalDuration.inMinutes}:${providerW!.totalDuration.inSeconds}"),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {

                  },
                  icon: const Icon(Icons.forward_10_outlined)),
              IconButton(
                onPressed: () {
                  providerW!.assetsAudioPlayer.previous();
                  providerW!.playButton = false;
                  providerR!.changeButton();
                },
                icon: const Icon(Icons.skip_next_outlined),
              ),
              IconButton(
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
                    ? const Icon(Icons.pause_circle_outline)
                    : const Icon(Icons.play_circle_outline),
              ),
              IconButton(
                onPressed: () {
                  providerW!.assetsAudioPlayer.next();
                  providerW!.playButton = false;
                  providerR!.changeButton();
                },
                icon: const Icon(Icons.skip_previous_outlined),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.forward_10_outlined)),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
