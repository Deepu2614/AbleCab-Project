import 'dart:async';

import 'package:ablecab/Pages/homepage.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key); // Update the constructor

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double wdt = 70;
  double hgt = 70;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      ext();
      Timer(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          PageTransition(child: MyHomePage(), type: PageTransitionType.rightToLeft)
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: wdt,
          width: hgt,
          child: Image.asset("assets/Logo4.png"),
        ),
      ),
    );
  }

  void ext() {
    setState(() {
      this.wdt = 150;
      this.hgt = 150;
    });
  }
}
