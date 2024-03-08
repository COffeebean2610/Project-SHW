import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDw1hLp3rXpDn0hF0YK9e2rPpWV2pPbS1k",
      appId: "1:631352079526:android:af104e752ea60434153067",
      messagingSenderId: "631352079526",
      projectId: "samruddhi-roadlines",
    )
  ):


  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream:FirebaseAuth.instance.authStateChanges(),
            builder:(context,usersnapshot){

              if(usersnapshot.hasData){
                return const Home();
              }
              else{
                return const Home();}
            })
    );
  }
  }