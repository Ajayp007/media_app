import 'package:carousel_slider/carousel_slider.dart';
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
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: providerR!.videoList.length,
          itemBuilder: (context, index, realIndex) {
            return Image.asset(
              "${providerW!.videoList[index].image}",
              fit: BoxFit.cover,
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 15 / 9,
            animateToClosest: true,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            autoPlayInterval: const Duration(seconds: 3),
            clipBehavior: Clip.antiAlias,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              providerR!.changeIndex(index);
            },
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            providerR!.videoList.length,
            (index) => Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      index == providerR!.index ? Colors.black : Colors.grey),
              margin: const EdgeInsets.all(2),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: providerR!.videoList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'playVideo', arguments: index);
                },
                child: Container(
                  height: 100,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "${providerW!.videoList[index].image}",
                        height: 90,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text("${providerW!.videoList[index].name}",style: TextStyle(fontSize: 18),)
                    ],
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
