import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      backgroundColor: Colors.orangeAccent,
        body:SafeArea(
          child:Center(
            child: Column(
              children:[
                SizedBox(height: 100,),
                Text("Hello world", style: TextStyle(fontSize: 50),),
                SizedBox(height: 100,),
                Icon(Icons.lock, size: 100,),
              ]
            )
           ),
     )
     );


  }
}