import 'package:arbori/splashscreen.dart';
import 'package:flutter/material.dart';

import 'apiListBuilder2.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Digitalized Horticulture App',
        theme: ThemeData(primarySwatch: Colors.blue),
        // home: MyApp_tts(),
        home: SplashScreen());
  }
}
