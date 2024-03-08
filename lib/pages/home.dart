import 'package:flutter/material.dart';
import 'locations_for_google_maps.dart';
import 'Search_Screen.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade600,
        elevation: 0,

        title:const Text("Samruddhi Roadlines",
          style: TextStyle(color: Colors.black,
              fontWeight:FontWeight.bold,
              fontFamily: "Times New Roman",
              fontStyle: FontStyle.italic,
            fontSize: 23,
          ),
        ),
        actions: <Widget>[
          IconButton(icon:const Icon(Icons.search, size: 30,),
            onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyHomePage(),
              ),
            );
            },
          )
        ],

      ),



      body:const LocationsForGoogleMaps(),
      backgroundColor: Colors.blue.shade100,

    );
  }
}
