import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:project_shw/models/map_locations.dart';

import 'search_screen.dart';

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
  Future<String?> _fetchMapLink() async {
    String mapLink = await mapLinkService.getMapLink(product.id);
    return mapLink;

  }

  void launchboth() async{
    var link = await _fetchMapLink();
    // ignore: await_only_futures
    Uri url = await Uri.parse(link.toString() );
    launchURL(url);

    Fluttertoast.showToast(
        msg: "Happy Journey",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue.shade200,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {

    //final Size textSize = MediaQuery.of(context).size;
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
            },
          ),

          const SizedBox(width: 23 / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height:MediaQuery.of(context).size.height/1.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top:12,bottom: 90,left: 12,right: 12),
                    padding: EdgeInsets.only(
                      top: 50*MediaQuery.of(context).size.width/360,//different for all screens error
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
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18*MediaQuery.of(context).size.width/360,//different for all screens error
                        ),
                      ),
                    ),


                  Container(
                    margin:  EdgeInsets.only(
                        top:530*MediaQuery.of(context).size.width/360,
                        left: 12,
                        right: 12,
                        bottom: 10),

                    padding:const EdgeInsets.all(3),

                    child: ElevatedButton(
                      onPressed: () {
                        //open googlemaps
                        launchboth();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape:const  RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                        ),
                      ),
                      child:const Text(
                        "Go To Map",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],

        ),
      ),
    );
  }
}