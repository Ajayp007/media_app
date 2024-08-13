import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_app/screens/video/videoprovider/video_provider.dart';
import 'package:provider/provider.dart';

class PlayVideoScreen extends StatefulWidget {
  const PlayVideoScreen({super.key});

  @override
  State<PlayVideoScreen> createState() => _PlayVideoScreenState();
}

class _PlayVideoScreenState extends State<PlayVideoScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video"),
      ),
      body: Container(
        height: 200,
        width: MediaQuery.sizeOf(context).width,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Chewie(controller: providerW!.chewieController!),
        ),
      ),
    );
  }
}
