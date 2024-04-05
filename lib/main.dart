import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_shw/pages/petrol_pumps.dart';

import 'auth/auth_screen.dart';
import 'loading_screen/splash_screen.dart';
import 'pages/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SplashScreen());
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyCyIQ7dsZVHg37gcBiAsK2K5Ev4bShYZ7c",
          appId: "1:631352079526:android:af104e752ea60434153067",
          messagingSenderId: "631352079526",
          projectId: "samruddhi-roadlines",
        ))
      : await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  Future<void> _initializeNotifications(BuildContext context) async {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
          // Handle notification tap here
          _gotopets(context);
        }
    );
    _setupNotificationHandling(context);
    _scheduleNotifications();
  }

  Future<void> _setupNotificationHandling(BuildContext context) async {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        // Handle notification tap here
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PetrolPumps()),
        );
      }
    );
  }
    void _gotopets(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PetrolPumps()),
      );
    }
  Future<void> _showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      'Notification Title',
      'Notification Body',
      platformChannelSpecifics,
      payload: 'New Payload',
    );
  }

  void _scheduleNotifications() {
    // Schedule notifications as needed
    // For example, you can use Timer or any other mechanism
    // to schedule notifications periodically or at specific times.
    // For demonstration, let's schedule a notification every minute.
    Timer.periodic(const Duration(seconds: 5), (timer) {
      _showNotification();
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, usersnapshot) {
              if (usersnapshot.hasData) {
                return const Home();
                // return PushNotificationScreen();
              } else {
                Fluttertoast.showToast(
                    msg: "Please Login",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.amber,
                    textColor: Colors.white,
                    fontSize: 16.0);
                return const Home();
              }
            }));
  }
}
// // final mapLocs = await MapLinksModel('mapLinks').fetchMapLinks();
// //final products = mapLocs.map((mapLoc) {
//   return MapLoc(
//     id: mapLoc.id,
//     title: mapLoc.title,
//     description: mapLoc.description,
//     linktolocation: mapLoc.linktolocation,
//     color: mapLoc.color,
//   );
// }).toList();
