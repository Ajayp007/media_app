import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_app/screens/video/videoprovider/video_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class PlayVideoScreen extends StatefulWidget {
  const PlayVideoScreen({super.key});

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<VideoProvider>().initVideo();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video"),
      ),
      body: Chewie(
        controller: providerW!.chewieController!,
      ),
    );
  }
}
