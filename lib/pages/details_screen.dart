import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_shw/models/MapLocations.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final MapLoc product;

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
        titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 23),
        leading: IconButton(icon:const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
            onPressed: () => Navigator.pop(context),
          ),


        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
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
                    margin: EdgeInsets.only(top:12,bottom: 90,left: 12,right: 12),
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

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}