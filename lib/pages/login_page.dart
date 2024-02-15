import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
        body:SafeArea(
          child:Center(
            child: Column(
              children:[
                const SizedBox(height: 100,),
                Text("Hello world", style: TextStyle(fontSize: 50),),
                const SizedBox(height: 100,),
                Icon(Icons.lock, size: 100,),
              ]
            )
           ),
     )
     );


  }
}