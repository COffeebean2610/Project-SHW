import 'package:flutter/material.dart';
import 'auth_form.dart';


class AuthScreen extends StatefulWidget{
  const AuthScreen({super.key});

  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Authentication',
          style: TextStyle(color: Colors.black,
          fontWeight:FontWeight.bold,
           fontFamily: "Times New Roman",
           fontStyle: FontStyle.italic,
          ),
      ),
        backgroundColor: Colors.blue.shade700,
      ),
      body: const AuthForm(),
      backgroundColor: Colors.blue.shade100,
    );
  }
}
