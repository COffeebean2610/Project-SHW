
import 'package:flutter/material.dart';
import '../models/map_locations.dart';

class NextScreen extends StatelessWidget {
  final List<MapLoc> filteredRoutes;

  const NextScreen(this.filteredRoutes, {super.key});

  @override
  Widget build(BuildContext context) {
    // Build your next screen using the filteredRoutes data
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtered Routes'),
      ),
      body: ListView.builder(
        itemCount: filteredRoutes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredRoutes[index].title),
            // Add more widgets based on your MapLoc model
          );
        },
      ),
    );
  }
}