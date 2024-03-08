import 'package:flutter/material.dart';
import 'package:project_shw/models/MapLocations.dart';
import 'package:project_shw/pages/details_screen.dart';
import 'package:project_shw/pages/item_card.dart';


class LocationsForGoogleMaps extends StatefulWidget {
  const LocationsForGoogleMaps({super.key});

  @override
  State<LocationsForGoogleMaps> createState() => _LocationsForGoogleMapsState();
}

class _LocationsForGoogleMapsState extends State<LocationsForGoogleMaps> {




  @override
  Widget build(BuildContext context) {
    return   Column(
      children: <Widget>[
        const Padding(padding: EdgeInsets.symmetric(horizontal:17.0,vertical: 17.0),
          child: Text("Routes For Samruddhi-Mahamarg",
            style: TextStyle(
              color: Colors.black,
              fontWeight:FontWeight.bold,
              fontFamily: "Times New Roman",
              fontStyle: FontStyle.italic,
              fontSize: 20
            ),
          ),

        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
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
                      builder: (context) => DetailsScreen(product: products[index]),
                    ),
                  );
                },

              ),
            ),
          ),
        ),

      ],
    );

    



  }

}
