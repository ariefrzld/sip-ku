import 'package:flutter/material.dart';
import 'package:sipku/home.dart';
import 'package:sipku/splash.dart';

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
