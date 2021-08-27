import 'dart:async';
import 'package:flutter/material.dart';
import 'find_food_screen.dart';
import 'help/help.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () => helpNavigateTo(context, FindFood()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
