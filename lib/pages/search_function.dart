import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/map_locations.dart';

//ignore: must_be_immutable
class NextScreen extends StatefulWidget {
   List<String> filteredRoute;
  NextScreen({super.key, required this.filteredRoute});

  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  late List<MapLoc> products = [];

  final Map<String, Color> colorMap = {
    'Colors.red': Colors.red,
    'Colors.blue': Colors.blue,
    'Colors.green': Colors.green,
    // Add more colors as needed
  };

  @override
  void initState() {
    _fetchProducts();
    super.initState();


  }

  Future<void> _fetchProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> productsSnapshot =
      await FirebaseFirestore.instance.collection('mapLinks').get();

      setState(() {
        products = productsSnapshot.docs
            .map((doc) =>
            MapLoc(
              id: doc.id,
              title: doc['title'],
              linktolocation: doc['link'],
              description: doc['description'],
              color: colorMap[doc['color']] ?? Colors.orange,
            ))
            .toList();
      });
    } catch (error) {
      // Handle error
      //  print("Error fetching products: $error");     for debugging purpose
      //some changes are made here
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              "Samruddhi Roadlines",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),

            )
        )
    );
  }
}
