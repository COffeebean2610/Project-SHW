import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../appbar/app_bar.dart';
import '../models/map_locations.dart';
import '../pages/details_screen.dart';
import '../pages/item_card.dart';

//ignore: must_be_immutable
class NextScreen extends StatefulWidget {
  final List<String> filteredRoute;

  NextScreen({Key? key, required this.filteredRoute}) : super(key: key);



  @override
  State<NextScreen> createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  late List<MapLoc?> products = [];

  final Map<String, Color> colorMap = {
    'Colors.red': Colors.red,
    'Colors.blue': Colors.blue,
    'Colors.green': Colors.green,
    // Add more colors as needed
  };



  @override
  void initState() {
    print(widget.filteredRoute);
    if (widget.filteredRoute.length == 2) {
      final String title = '${widget.filteredRoute[0]} to ${widget.filteredRoute[1]}';
      print(title);
      _fetchProducts(title);
    }
    super.initState();
  }

  Future<void> _fetchProducts(String title) async {
    print(widget.filteredRoute);

    try {
      QuerySnapshot<Map<String, dynamic>> productsSnapshot =
      await FirebaseFirestore.instance.collection('mapLinks').get();

      setState(() {
        products = productsSnapshot.docs.map((doc) {
          if (title == doc['title']) {
            return MapLoc(
              id: doc.id,
              title: doc['title'],
              linktolocation: doc['link'],
              description: doc['description'],
              color: colorMap[doc['color']] ?? Colors.orange,
            );
          } else {
            return null;
          }
        }).toList();
      });
    } catch (error) {
      // Handle error
      print("Error fetching products: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(17 * MediaQuery.of(context).devicePixelRatio),
        child: const AppDrawerForAll(title: 'Samruddhi-Mahamarg'),
      ),
      body: Column(

        children: <Widget>[
          Padding(

            padding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 17.0),
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
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 23,
                  crossAxisSpacing: 23,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  if (product != null) {
                    return ItemCard(
                      product: product,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(product: product, link: product.linktolocation),
                          ),
                        );
                      },
                    );
                  } else {
                    // Return an empty container if product is null
                    return Container();
                  }
                },
              ),
            ),
          ),
        ],
      ),
        backgroundColor: Colors.blue.shade200,
    );
  }
}
