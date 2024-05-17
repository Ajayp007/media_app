import 'package:flutter/material.dart';
import 'package:media_app/screens/music/musicprovider/music_provider.dart';
import 'package:media_app/screens/video/videoprovider/video_provider.dart';
import 'package:media_app/utils/routs.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: MusicProvider(),
        ),
        ChangeNotifierProvider.value(
          value: VideoProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: appRouts,
      ),
    ),
  );
}
