import 'package:flutter/material.dart';
import 'package:golden_bite/screens/festivals/festivals.dart';

void main() {
  runApp(MaterialApp(
    title: 'Golden Bite',
    home: FestivalsPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        colorScheme: ColorScheme.dark(primary: const Color(0xffdda74f))),
    themeMode: ThemeMode.dark,
  ));
}

class GoldenBite extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      home: new FestivalsPage(),
    );
  }
}
