import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_shw/models/map_locations.dart';
import 'package:project_shw/pages/details_screen.dart';
import 'package:project_shw/pages/item_card.dart';


class LocationsForGoogleMaps extends StatefulWidget {
  const LocationsForGoogleMaps({super.key});

  @override
  State<LocationsForGoogleMaps> createState() => _LocationsForGoogleMapsState();
}

class _LocationsForGoogleMapsState extends State<LocationsForGoogleMaps> {
  List<MapLoc> products = [];
  bool isLoading = true;
  final Map<String, Color> colorMap = {
    'Colors.white': Colors.white,


    // Add more colors as needed
  };

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> productsSnapshot =
      await FirebaseFirestore.instance.collection('mapLinks').get();

      setState(() {
        products = productsSnapshot.docs
            .map((doc) => MapLoc(
          id: doc.id,
          title: doc['title'] ?? "blank value",
          linktolocation: doc['link'] ?? "blank Value",
          description: doc['description'] ?? "blank Value",
          color: colorMap[doc['color']] ?? Colors.grey.shade100,
        ))
            .toList();
        isLoading = false;
      });
    } catch (error) {
      // Handle error
      //print("Error fetching products: $error");
      // Some changes are made here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 17.0),
            child: Text(
              "Routes For Samruddhi-Mahamarg",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
                fontFamily: "Times New Roman",
                fontStyle: FontStyle.italic,
                fontSize: 20 * MediaQuery.of(context).size.width / 360,
              ),
            ),
          ),
          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator(color: Colors.amber,)) // Loading indicator
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 23,
                  crossAxisSpacing: 23,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: products[index],
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          product: products[index],
                          link: products[index].linktolocation,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade900,
    );

  }
}
