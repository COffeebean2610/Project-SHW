import 'package:flutter/material.dart';
import 'package:project_shw/models/map_locations.dart';
import 'package:project_shw/pages/details_screen.dart';
import 'package:project_shw/pages/item_card.dart';

class LocationsForGoogleMaps extends StatefulWidget {
  const LocationsForGoogleMaps({Key? key}) : super(key: key);

  @override
  State<LocationsForGoogleMaps> createState() => _LocationsForGoogleMapsState();
}

class _LocationsForGoogleMapsState extends State<LocationsForGoogleMaps> {
  late List<MapLoc> products;

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final fetchedProducts = await MapLinksModel('mapLinks').fetchMapLinks();
    setState(() {
      products = fetchedProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 17.0),
          child: Text(
            "Routes For Samruddhi-Mahamarg",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Times New Roman",
              fontStyle: FontStyle.italic,
              fontSize: 20 * MediaQuery.of(context).size.width / 360,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: products != null
                ? GridView.builder(
              itemCount: products.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
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
                      builder: (context) =>
                          DetailsScreen(product: products[index]),
                    ),
                  );
                },
              ),
            )
                : Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }
}
