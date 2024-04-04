import 'dart:io';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveBackgroundNotificationResponse);

  tz.initializeTimeZones();
  runApp(const MyApp());
}

Future<void> onDidReceiveBackgroundNotificationResponse(
    NotificationResponse notificationResponse) async {
  final String? payload = notificationResponse.payload;
  if (payload != null) {
    debugPrint('notification payload: $payload');
  }
}

void scheduleNotifications() async {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Clear all scheduled notifications
  await flutterLocalNotificationsPlugin.cancelAll();

  // Define the notification details
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'your_channel_id', // Change this to your channel id
    'Your Channel Name', // Change this to your channel name
    // Change this to your channel description
    importance: Importance.max,
    priority: Priority.high,
    enableVibration: true,
  );
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  // Schedule notifications at intervals
  for (int i = 0; i < 5; i++) {
    // Calculate the time for the notification
    var scheduledTime = tz.TZDateTime.now(tz.local)
        .add(Duration(minutes: i * 15)); // Change interval here

    // Schedule the notification
    await flutterLocalNotificationsPlugin.zonedSchedule(
      i,
      'Scheduled Notification',
      'Notification ${i + 1} after ${i * 15} minutes', // Change notification message here
      scheduledTime,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}

Future<void> onDidReceiveNotificationResponse(
    int id, String? title, String? body, String? payload) async {
  // Handle the notification response
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
                //return const Home();
                return Container(
                  child: ElevatedButton(
                    onPressed:scheduleNotifications,
                    child: const Text('Schedule Notifications'),

                  ),
                );
              } else {
                Fluttertoast.showToast(
                    msg: "Please Login",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.amber,
                    textColor: Colors.white,
                    fontSize: 16.0);
                return const AuthScreen();
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
