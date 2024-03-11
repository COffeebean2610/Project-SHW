import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'auth/auth_screen.dart';
import 'models/map_locations.dart';
import 'pages/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyCyIQ7dsZVHg37gcBiAsK2K5Ev4bShYZ7c",
          appId: "1:631352079526:android:af104e752ea60434153067",
          messagingSenderId: "631352079526",
          projectId: "samruddhi-roadlines",
        ))
      : await Firebase.initializeApp();
  final mapLocs = await MapLinksModel('mapLinks').fetchMapLinks();
  final products = mapLocs.map((mapLoc) {
    return MapLoc(
      id: mapLoc.id,
      title: mapLoc.title,
      description: mapLoc.description,
      linktolocation: mapLoc.linktolocation,
      color: mapLoc.color,
    );
  }).toList();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, usersnapshot) {
              if (usersnapshot.hasData) {
                return const Home();
              } else {
                Fluttertoast.showToast(
                    msg: "Please Login",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.blue.shade600,
                    textColor: Colors.black,
                    fontSize: 16.0);
                return const AuthScreen();
              }
            }));
  }
}
