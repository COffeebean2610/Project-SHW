import 'package:flutter/material.dart';

import 'package:project_shw/search_screen/search_function.dart';
import '../models/map_locations.dart'; // Make sure to import your map_locations.dart file

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

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

    "Arvi-Pulgaon",
    "Aurangabad",
    "Dhamangaon Railway Station",
    "Dusarbid",
    "Jalna",
    "Karanja Lad",
    "Lasur",
    "Malegaon-Jahangir",
    "Mehkar",
    "MIDC Buti Buri",
    "Nagpur",
    "Seloo Bajar",
    "Sindkhed Raja",
    "Sindhi Dry Port",
    "Shirdi",
    "Verul",
    "Vaijapur",
    "Wardha",
    "Yavatmal-Amravati"
  ];

  late List<String> filteredRoute;

  filterRou(String from, String to) {
    // print(filteredRoute);
    filteredRoute = [from, to];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.grey.shade900,Colors.grey.shade900],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: const [0.1,0.9],


            )
        ),
        child: Center(
          key: globalKey,
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    "Select the path you want to follow",
                    style: TextStyle(
                        fontFamily: "Times New Roman",
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 40 * MediaQuery.of(context).size.aspectRatio),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.amber,
                    ),
                    dropdownColor: Colors.amber,
                    icon: const Icon(
                      Icons.arrow_drop_down_circle_rounded,
                      color: Colors.amber,
                    ),
                    iconSize: 23,
                    alignment: Alignment.center,
                    menuMaxHeight: MediaQuery.of(context).size.height * 0.5-MediaQuery.of(context).padding.bottom,
                    isDense: true,

                    isExpanded: true,
                    hint: const Text(
                      "Select From",
                      style: TextStyle(color: Colors.white),
                    ),
                    value: _fromLocation.isNotEmpty ? _fromLocation : null,
                    items: listItems
                        .map((item) => DropdownMenuItem(
                              value: item,
                      alignment: Alignment.center,
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
                  child:


                      DropdownButton(
                        //the dropdown menu should appear under the textfield
                        underline: Container(
                          height: 2,
                          color: Colors.amber,
                        ),

                        style: const TextStyle(fontSize: 20, color: Colors.black),
                        dropdownColor: Colors.amber,
                        icon: const Icon(Icons.arrow_drop_down_circle_rounded,
                            color: Colors.amber),
                        iconSize: 23,
                        alignment: Alignment.center,
                        menuMaxHeight: MediaQuery.of(context).size.height * 0.5-MediaQuery.of(context).padding.bottom,
                        isDense: true,

                        isExpanded: true,
                        hint: const Text(
                          "Select End Point",
                          style: TextStyle(color: Colors.white),
                        ),
                        value: _toLocation.isNotEmpty ? _toLocation : null,
                        items: listItems
                            .map((item) => DropdownMenuItem(
                            alignment:Alignment.center,

                                  value: item,
                                  child: Text(item,style: const TextStyle(color: Colors.white),),
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
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(160, 20)),
                    backgroundColor: MaterialStateProperty.all(Colors.amber),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
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
                            'Please enter both "From" and "To" locations.',
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Search',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 680 * MediaQuery.of(context).size.aspectRatio,
                ),
               
          Image.asset(
            "assets/images/logo.png",


          ),
          ]
            ),
          ),
        ),
      ),
    );
  }
}
