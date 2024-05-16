import 'package:flutter/material.dart';
import 'package:media_app/screens/audio/view/audio_screen.dart';
import 'package:media_app/screens/video/view/video_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Media App"),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.audiotrack_outlined)),
              Tab(icon: Icon(Icons.video_collection_outlined)),
            ],
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: TabBarView(
            children: [
              AudioScreen(),
              VideoScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
