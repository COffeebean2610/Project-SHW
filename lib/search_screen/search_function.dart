import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' ;
import '../appbar/app_bar.dart';
import '../models/map_locations.dart';
import '../pages/details_screen.dart';
import '../pages/item_card.dart';

class NextScreen extends StatefulWidget {
  final List<String> filteredRoute;

  const NextScreen({Key? key, required this.filteredRoute}) : super(key: key);

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  List<MapLoc?> products = [];
  bool isLoading = true;

  final Map<String, Color> colorMap = {
    'Colors.red': Colors.red,
    'Colors.blue': Colors.blue,
    'Colors.green': Colors.green,
    // Add more colors as needed
  };

  @override
  void initState() {
    super.initState();
    if (widget.filteredRoute.length == 2) {
      final String title = '${widget.filteredRoute[0]} to ${widget.filteredRoute[1]}';
      _fetchProducts(title);
    }
  }

  Future<void> _fetchProducts(String title) async {
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
          if (item['title'] == title) {
            return MapLoc(
              id: item['id'],
              title: item['title'],
              linktolocation: item['link'],
              description: item['info'],
              color: Colors.orange, // Assuming a default color for now
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(17 * MediaQuery.of(context).devicePixelRatio),
        child: const AppDrawerForAll(title: 'Samruddhi-Mahamarg'),
      ),
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
                ? const Center(child: CircularProgressIndicator()) // Loading indicator
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GestureDetector(
                onTap: () {
                  // Handle tap action here
                },
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                              builder: (context) => DetailsScreen(product: product, link: product.linktolocation),
                            ),
                          );
                        },
                      );
                    } else {
                      return Container(); // Return an empty container if product is null
                    }
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
