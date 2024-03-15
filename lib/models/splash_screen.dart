import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}): super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Home()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue, Colors.pink],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Splash Screen',
                style: TextStyle(color: Colors.white, fontSize: 35),
              )
            ]),
      ),
    );
  }
}


