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
    context.read<AudioProvider>().playButton = false;
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 420,
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
                    value: 1,
                    onChanged: (value) {},
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
                  Icons.forward_10_outlined,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  providerW!.assetsAudioPlayer.next();
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
                  providerW!.assetsAudioPlayer.previous();
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
                  Icons.forward_10_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
          const Spacer(),
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
