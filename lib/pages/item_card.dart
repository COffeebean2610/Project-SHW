import 'package:flutter/material.dart';
import 'package:project_shw/models/map_locations.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.product, required this.press})
      : super(key: key);

  final MapLoc product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 200, // Set your desired width
        height: 200, // Set your desired height
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(23),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.amber,
                    width: 2.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9), // Set shadow color
                    ),
                  ],
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Hero(
                  tag: product.id,
                  child: Text(
                    product.title,
                    style:const TextStyle(color: Colors.amber,fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
