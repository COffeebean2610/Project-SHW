import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:project_shw/models/MapLocations.dart';

import 'Search_Screen.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final MapLoc product;
  void launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // each product have a color
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor:Colors.blue.shade600,
        elevation: 0,
        title: Text(product.title),
        titleTextStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23),
        leading: IconButton(icon:const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
            onPressed: () => Navigator.pop(context),
          ),


        actions: <Widget>[
          IconButton(
            icon:const  Icon(Icons.search, color: Colors.black),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),

          const SizedBox(width: 23 / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top:12,bottom: 90,left: 12,right: 12),
                    padding: EdgeInsets.only(
                      top: size.height ,
                      left: 23,
                      right: 23,
                    ),
                    // height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(23),
                      ),
                    ),

                  ),
                    Container(
                      margin: const EdgeInsets.only(top: 12,bottom: 90,left: 12,right: 12),
                      padding: const EdgeInsets.only(
                        top: 50,
                        left: 23,
                        right: 23,
                      ),
                      child: Text(product.description,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 23
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 12,bottom: 90,left: 12,right: 12),
                      padding: const EdgeInsets.only(
                        top: 700,
                        left: 23,
                        right: 23,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          //open googlemaps
                          launchUrl(Uri.parse(product.linktolocation));

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                          ),
                        ),
                        child: const Text("Go To Map",style: TextStyle(color: Colors.white),),

                      ),
                      // height: 500,



                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}