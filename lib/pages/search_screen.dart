import 'package:flutter/material.dart';
import 'package:project_shw/pages/search_function.dart';
import '../models/map_locations.dart'; // Make sure to import your map_locations.dart file

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

 class SearchScreenState extends State<SearchScreen> {
  var _fromLocation = "";
  var _toLocation = "";
  late List<MapLoc> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Samruddhi Roadlines",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: "Times New Roman",
            fontStyle: FontStyle.italic,
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.blue.shade600,
      ),
      backgroundColor: Colors.blue.shade100,
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter start point";
                  }
                  return null;
                },
                onSaved: (value) {
                  _fromLocation = value!;
                },
                decoration: InputDecoration(
                  labelText: "From",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 11),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Endpoint";
                  }
                  return null;
                },
                onSaved: (value) {
                  _toLocation = value!;
                },
                decoration: InputDecoration(
                  labelText: "To",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_fromLocation.isNotEmpty && _toLocation.isNotEmpty) {
                    List<MapLoc> filteredRoutes = products
                        .where((route) =>
                    route.title
                        .toLowerCase()
                        .contains(_fromLocation.toLowerCase()) &&
                        route.title
                            .toLowerCase()
                            .contains(_toLocation.toLowerCase()))
                        .toList();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextScreen(filteredRoutes),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Please enter both "From" and "To" locations.'),
                      ),
                    );
                  }
                },
                child: const Text('Search'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


