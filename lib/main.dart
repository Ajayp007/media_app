import 'package:flutter/material.dart';
import 'package:media_app/screens/home/provider/home_provider.dart';
import 'package:media_app/utils/routs.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: appRouts,
      ),
    ),
  );
}
