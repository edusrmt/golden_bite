import 'package:flutter/material.dart';
import 'package:golden_bite/constants.dart';
import 'package:golden_bite/screens/login/login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Golden Bite',
    home: Login(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(colorScheme: ColorScheme.dark(primary: kPrimaryColor)),
    themeMode: ThemeMode.dark,
  ));
}

class GoldenBite extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new MaterialApp(
      home: new Login(),
    );
  }
}
