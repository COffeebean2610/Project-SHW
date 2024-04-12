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
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.grey.shade900, Colors.grey.shade900],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: const [0.1, 0.9],
        )),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(34),
                height: 130,
                width: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(23),
                  child: Image(
                    image: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL!,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(34),
                child: Text(
                  FirebaseAuth.instance.currentUser!.displayName!,
                  style: TextStyle(
                      color: Colors.amber,
                      fontFamily: "Times New Roman",
                      fontWeight: FontWeight.bold,
                      fontSize: 40 * MediaQuery.of(context).size.aspectRatio),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(34),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber, elevation: 50),
                      onPressed: logout,
                      child: const Text('LOGOUT'))),
              SizedBox(
                height: 300* MediaQuery.of(context).size.aspectRatio,
              ),
              Image.asset(
                "assets/images/logo.png",
                // Make sure to provide the correct path to your image asset
                // Also, you can adjust the width and height of the image as needed
              fit: BoxFit.scaleDown,
              ),
            ],
          ),
        ));
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
