import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Center(child: ElevatedButton(onPressed: logout , child: Text('Logout'))),);

  }
  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
