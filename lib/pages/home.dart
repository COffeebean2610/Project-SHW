import 'package:flutter/material.dart';
import 'locations_for_google_maps.dart';
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
        backgroundColor: Colors.blue.shade100,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), onPressed: () {  },
        ),
        title:const Text("Samruddhi Roadlines",
          style: TextStyle(color: Colors.black,
              fontWeight:FontWeight.bold,
              fontFamily: "Times New Roman",
              fontStyle: FontStyle.italic,
            fontSize: 15,
          ),
        ),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search)
            ,onPressed: (){},
          )
        ],

      ),
      body:const LocationsForGoogleMaps(),
    );
  }
}
