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
    "Samruddhi Mahamarg is a state-of-the-art expressway connecting Shirdi to Nagpur, offering travelers a seamless journey between these two significant cities. This route ensures efficient travel with well-maintained roads, modern amenities, and advanced traffic management systems. Commuters can expect a smooth and comfortable drive, passing through picturesque landscapes and rural areas, before reaching the bustling city of Nagpur.";