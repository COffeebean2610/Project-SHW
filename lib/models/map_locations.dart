import 'package:flutter/material.dart';
import 'package:project_shw/models/map_link_model.dart';

MapLinkService mapLinkService = MapLinkService();
class MapLoc {
  final String  title, description,linktolocation;
  final int  id;
  final Color color;

  MapLoc(
      {
        required this.title,
        required this.description,
        required this.id,
        required this.linktolocation,
        required this.color});
}

List<MapLoc> products = [
  MapLoc(
      linktolocation:'',
      id: 1,
      title: "Khrud to Nagpur",

      description: dummyText,

      color: const Color(0xFF3D82AE)),
  MapLoc(
      id: 2,
      title: "Route 2",


      linktolocation:' https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
      description: dummyText,
      color:const Color(0xFFD3A984)),
  MapLoc(
      id: 3,
      title: "Route 3",

      linktolocation:' https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',

      description: dummyText,

      color:const Color(0xFF989493)),
  MapLoc(
      id: 4,
      title: "Route 4",

      linktolocation:' https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',

      description: dummyText,

      color:const Color(0xFFE6B398)),
  MapLoc(
      id: 5,
      title: "Route 5",


      linktolocation:' https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
      description: dummyText,

      color:const Color(0xFFFB7883)),
  MapLoc(
    id: 6,
    title: "Route 6",


    linktolocation:' https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
    description: dummyText,

    color: const Color(0xFFAEAEAE),
  ),
  MapLoc(
    id: 6,
    title: "Route 6",


    linktolocation:'https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
    description: dummyText,

    color:const Color(0xFFAEAEAE),
  ),MapLoc(
    id: 6,
    title: "Route 6",


    linktolocation:' https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
    description: dummyText,

    color:const Color(0xFFAEAEAE),
  ),


];

Future<String> getMapLink() async => mapLinkService.getMapLink();

String dummyText =
    "Khrud to Nagpur\n"
    "Petrol Pumps : 6\n"
    "Total Time :6 hr 57 min\n"
    "Total Distance : 599 km\n"
    "The petrol pumps are optional to visit.\n"
    "Prerequisites : You should be near the start point\n."
    "May your Journey be Safe.";