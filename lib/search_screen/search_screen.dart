import 'package:flutter/material.dart';
import 'package:project_shw/pages/locations_for_google_maps.dart';
import 'package:project_shw/search_screen/search_function.dart';
import '../models/map_locations.dart'; // Make sure to import your map_locations.dart file

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  // final _fromLocationController = TextEditingController();
  // final _toLocController = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  var _fromLocation = '';
  var _toLocation = '';
  late List<MapLoc> products;
  List listItems = [
    'Nagpur',
    "Khrud",
    'MIDC Buti Bori',
    'Sindhi Dry Port',
    'Wardha',
    "Ari-Pulgaon",
    "DhamanGaon Railway Station",
    "Yavatmal-Amravati",
    "Karanja lad",
    "Seloo Bazar",
    "Malegaon-Jahangir",
    "Mehkar",
    "Dusarbid",
    "Sindhkhed Raja",
    "Jalna",
    "Shendra MIDC",
    "Aurangabad (Sambhaji nagar)",
    "Verul",
    "Lasur",
    "Vaijapur",
    "Shirdi",
    "Sinnar",
    "Nashik Connector",
    "Igatpuri",
    "Shahpur",
    "Bhiwandi"
  ];

  late List<String> filteredRoute;

  filterRou(String from, String to) {
    // print(filteredRoute);
    filteredRoute = [from, to];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Center(
        key: globalKey,
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Select the path you want to follow",
                style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 8*MediaQuery.of(context).devicePixelRatio
                ),

              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  dropdownColor: Colors.blueAccent.shade100,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 23,
                  isExpanded: true,
                  hint: const Text("Select From"),
                  value: _fromLocation.isNotEmpty ? _fromLocation : null,
                  items: listItems
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _fromLocation = value.toString();
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  dropdownColor: Colors.blueAccent.shade100,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 23,
                  isExpanded: true,
                  hint: const Text("Select End Point"),
                  value: _toLocation.isNotEmpty ? _toLocation : null,
                  items: listItems
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _toLocation = value.toString();
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (_fromLocation.isNotEmpty && _toLocation.isNotEmpty) {
                    filterRou(_fromLocation, _toLocation);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextScreen(
                          filteredRoute: filteredRoute,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                            'Please enter both "From" and "To" locations.'),
                      ),
                    );
                  }
                },
                child: const Text('Search'),
              ),
              SizedBox(
                height: 160 * MediaQuery.of(context).devicePixelRatio,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue.shade600),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LocationsForGoogleMaps(),
                      ),
                    );
                  },
                  child: const Text('See All Routes')),
            ],
          ),
        ),
      ),
    );
  }
}
