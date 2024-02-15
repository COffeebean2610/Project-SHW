import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool passwordVisible = true;

  void togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SafeArea(
        child: Center(
          child: Column(
              children: [
                const SizedBox(height: 50,),
                const Icon(Icons.lock, size: 50,),
                const SizedBox(height: 20,),
                const Text("Login", style: TextStyle(fontSize: 16,color:Colors.black)),
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(),

                      hintText: 'Username',
                      fillColor: Colors.green,
                      filled: true,
                    ),
                  ),
                ),
               const SizedBox(height: 20,),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: togglePasswordVisibility,
                        icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      fillColor: Colors.green,
                      filled: true,

                      hintText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(height: 20,),

              ]
          ),
        ),
      ),
    );
  }
}
