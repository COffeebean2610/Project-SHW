import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:project_shw/models/map_locations.dart';
import '../appbar/app_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product, required this.link});
  final String link;
  final MapLoc product;

  void launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchboth() async {
    Uri url = Uri.parse(link.toString());
    launchURL(url);
    Fluttertoast.showToast(
        msg: "Happy Journey",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue.shade200,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(17 * MediaQuery.of(context).devicePixelRatio),
          child: const AppDrawerForAll(
            title: 'Samruddhi-Mahamarg',
          )),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        top: 12, bottom: 90, left: 12, right: 12),
                    padding: EdgeInsets.only(
                      top: 50 *
                          MediaQuery.of(context).size.width /
                          360, //different for all screens error
                      left: 23,
                      right: 23,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(23),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 50, bottom: 90, left: 12, right: 12),
                    padding: const EdgeInsets.only(
                      top: 50,
                      bottom: 50,
                      left: 23,
                      right: 23,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(color: Colors.amber, width: 1.2)),
                    child: Text(
                      product.description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18 *
                            MediaQuery.of(context).size.width /
                            360, //different for all screens error
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          top:230 , bottom: 90, left: 90, right: 12),
                      padding: const EdgeInsets.only(
                        top: 50,
                        bottom: 50,
                        left: 23,
                        right: 23,
                      ),
                      child: Text(
                    "How to Skip a Stop?",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 18 * MediaQuery.of(context).size.width / 360,
                        fontWeight: FontWeight.bold),
                  )),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 250, bottom: 90, left: 70, right: 12),
                    padding: const EdgeInsets.only(
                      top: 50,
                      bottom: 50,
                      left: 23,
                      right: 23,
                    ),
                    child: Image.asset(
                      "assets/images/tutorial.gif",
                      height: 900 * MediaQuery.of(context).size.aspectRatio,
                      width: 400 * MediaQuery.of(context).size.aspectRatio,

                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 1400 * MediaQuery.of(context).size.aspectRatio,
                        left: 300 * MediaQuery.of(context).size.aspectRatio,
                        right: 12 * MediaQuery.of(context).size.aspectRatio,
                        bottom: 10 * MediaQuery.of(context).size.aspectRatio),
                    padding: const EdgeInsets.all(6),
                    child: ElevatedButton(
                      onPressed: () {
                        //open googlemaps
                        launchboth();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(80)),
                        ),
                      ),
                      child: const Text(
                        "Go To Map",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
