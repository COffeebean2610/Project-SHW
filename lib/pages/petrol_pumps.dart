import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PetrolPumps extends StatefulWidget {
  const PetrolPumps({ Key? key}) : super(key: key);

  @override
  State<PetrolPumps> createState() => _PetrolPumpsState();
}

class _PetrolPumpsState extends State<PetrolPumps> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
    _setupNotificationHandling();
    _scheduleNotifications();
    _stopNotificationsAfterDelay(Duration(seconds: 10)); // Change the duration as needed
  }

  Future<void> _setupNotificationHandling() async {
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
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
    _timer = Timer.periodic(Duration(seconds: 30), (timer) {
      _showNotification();
    });
  }

  void _stopNotificationsAfterDelay(Duration delay) {
    Timer(delay, () {
      _timer?.cancel(); // Cancel the timer to stop notifications
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Petrol Pumps')));
  }

  @override
  void dispose() {
    _timer?.cancel(); // Dispose of the timer to prevent memory leaks
    super.dispose();
  }
}
