import 'package:flutter/material.dart';
import 'package:project_shw/models/MapLocations.dart';



class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final MapLoc product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(23),
              decoration: BoxDecoration(
                color: product.color,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9), // Set shadow color
                    spreadRadius: 3, // Set the spread radius of the shadow
                    blurRadius: 9, // Set the blur radius of the shadow
                    offset:const  Offset(0, 5), // Set the offset of the shadow
                  ),
                ],

                borderRadius: BorderRadius.circular(23),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Text(product.description),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 23 / 4),
            child: Text(
              // products is out demo list
              product.title,
              style: TextStyle(color: Colors.green),
            ),
          ),

        ],
      ),
    );
  }
}