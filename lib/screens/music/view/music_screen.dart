import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../musicprovider/music_provider.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  MusicProvider? providerR;
  MusicProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: providerR!.musicList.length,
          itemBuilder: (context, index, realIndex) {
            return Image.asset(
              "${providerW!.musicList[index].image}",
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
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            providerR!.musicList.length,
            (index) => Container(
              height: 10,
              margin: const EdgeInsets.all(5),
              width: 10,
              decoration: BoxDecoration(
                  color: index == providerR!.indiIndex
                      ? Colors.black
                      : Colors.grey,
                  shape: BoxShape.circle),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: providerR!.musicList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  providerR!.changeIndex(index);
                  Navigator.pushNamed(context, 'playMusic', arguments: index);
                },
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "${providerW!.musicList[index].image}",
                        height: 90,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text("${providerW!.musicList[index].name}")
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
