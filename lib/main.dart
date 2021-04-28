import 'package:flutter/material.dart';
import 'package:sipku/page/home/home.dart';
import 'package:sipku/page/splash/splash.dart';

void main() {
  runApp(Home());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Splash",
      home: Splash(),
    );
  }
}
