import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mdcat_kawiish/config/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen() : super();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(
          RoutesName.loginScreen); // Use your defined route name
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:const Center(child: Text('Splash Screen')),
      ),
    );
  }
}
