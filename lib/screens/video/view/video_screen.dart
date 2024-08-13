import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../videoprovider/video_provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<VideoProvider>().initVideo();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: providerR!.videoList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.read<VideoProvider>().changeIndex(index);
                  Navigator.pushNamed(context, 'playVideo', arguments: index);
                },
                child: Container(
                  height: 200,
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image:
                            AssetImage("${providerW!.videoList[index].image}"),
                        fit: BoxFit.fitWidth),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
