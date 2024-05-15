import 'package:flutter/material.dart';
import 'package:media_app/screens/home/view/home_screen.dart';
import 'package:media_app/screens/tab/playmusic_screen.dart';

Map<String, WidgetBuilder> appRouts = {
  '/':(context) => const HomeScreen(),
  'playMusic':(context) => const PlayMusicScreen(),
};
