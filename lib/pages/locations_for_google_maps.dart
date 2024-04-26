import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_shw/models/map_locations.dart';
import 'package:project_shw/pages/details_screen.dart';
import 'package:project_shw/pages/item_card.dart';

class LocationsForGoogleMaps extends StatefulWidget {
  const LocationsForGoogleMaps({super.key});

  @override
  State<LocationsForGoogleMaps> createState() => _LocationsForGoogleMapsState();
}

class _LocationsForGoogleMapsState extends State<LocationsForGoogleMaps> {
  List<MapLoc?> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    String uri = "https://mangalgrahsevasanstha.org.in/test/project_shw/view_data.php";

    setState(() {
      isLoading = true;
    });

    try {
      Response response = await get(Uri.parse(uri));
      List<dynamic> data = json.decode(response.body) as List<dynamic>;

      setState(() {
        // Clear existing products
        products.clear();

        // Filter and map data to products list
        products = data.map((item) {
          if (item['title'] != null) {
            return MapLoc(
              id: item['id'],
              title: item['title'],
              linktolocation: item['link'],
              description: item['info'],
               // Assuming a default color for now
            );
          } else {
            return null;
          }
        }).where((element) => element != null).toList();

        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching products: $error");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 17.0, vertical: 17.0),
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
                ? const Center(
                    child: CircularProgressIndicator(
                    color: Colors.amber,
                  ))
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 23,
                        crossAxisSpacing: 23,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        if (product != null) {
                          return ItemCard(
                            product: product,
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    product: product,
                                    link: product.linktolocation,
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Container(); // or any other placeholder widget
                        }
                      },
                    ),
                  ),
          ),
        ],
      ),
         backgroundColor: Colors.grey.shade900,
    );
  }
}


