import 'package:flutter/material.dart';
import 'package:project_shw/pages/search_function.dart';
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
  var _toLocation ='';
  late List<MapLoc> products;
  List listItems=['Nagpur', 'Pune'  ];

  late List<String> filteredRoute;


  filterRou(String from, String to) {
     filteredRoute = [from,to];

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
            fontFamily: "Times New Roman",
            fontStyle: FontStyle.italic,
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.blue.shade600,
      ),
      backgroundColor: Colors.blue.shade100,
      body: Center(
        key: globalKey,
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  style:const TextStyle(fontSize: 20, color: Colors.black),
                  dropdownColor: Colors.blueAccent.shade100,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 23,
                  isExpanded: true,
                  hint: const Text("Select From"),
                  value: _fromLocation.isNotEmpty ? _fromLocation : null,
                  items: listItems.map((item) =>
                      DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      )
                  ).toList(),
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
                  style:const TextStyle(fontSize: 20, color: Colors.black),
                  dropdownColor: Colors.blueAccent.shade100,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 23,
                  isExpanded: true,
                  hint: const Text("Select End Point"),
                  value: _toLocation.isNotEmpty ? _toLocation : null,
                  items: listItems.map((item) =>
                      DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      )
                  ).toList(),
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


                   filterRou(_fromLocation,_toLocation);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextScreen(filteredRoute),
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
            ],
          ),
        ),
      ),
    );
  }
}
