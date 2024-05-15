import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/provider/home_provider.dart';

class PlayMusicScreen extends StatefulWidget {
  const PlayMusicScreen({super.key});

  @override
  State<PlayMusicScreen> createState() => _PlayMusicScreenState();
}

class _PlayMusicScreenState extends State<PlayMusicScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().initChange();
  }

  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();

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
          const LinearProgressIndicator(
            value: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  providerW!.assetsAudioPlayer.previous();
                },
                icon: const Icon(Icons.skip_next_outlined),
              ),
              IconButton(
                onPressed: () {
                  if (providerW!.playButton) {
                    providerW!.assetsAudioPlayer.pause();
                    providerR!.changeButton(false);
                  } else {
                    providerW!.assetsAudioPlayer.play();
                    providerR!.changeButton(true);
                  }
                },
                icon: providerR!.playButton
                    ? const Icon(Icons.pause_circle_outline)
                    : const Icon(Icons.play_circle_outline),
              ),
              IconButton(
                onPressed: () {
                  providerW!.assetsAudioPlayer.next();
                },
                icon: const Icon(Icons.skip_previous_outlined),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
