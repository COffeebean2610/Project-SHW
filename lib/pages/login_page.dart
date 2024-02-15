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
                SizedBox(height: 50,),
                Icon(Icons.lock, size: 50,),

                SizedBox(height: 20,),
                Text("Login", style: TextStyle(fontSize: 16,color:Colors.black)),

                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child:  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Username',
                      hintText: 'Username',
                    ),
                  ),
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Password',

                  ),
                ),
             ),




              ]
            )
           ),
     )
     );


  }
}