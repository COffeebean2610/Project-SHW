import 'package:flutter/material.dart';

class MapLoc {
  final String  title, description,linktolocation;
  final int price, size, id;
  final Color color;

  MapLoc(
      {
        required this.title,
        required this.description,
        required this.price,
        required this.size,
        required this.id,
        required this.linktolocation,
        required this.color});
}

List<MapLoc> products = [
  MapLoc(
      id: 1,
      title: "Shirdi To Nagpur",
      price: 234,
      size: 12,
      linktolocation:'https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
      description: dummyText,

      color: Color(0xFF3D82AE)),
  MapLoc(
      id: 2,
      title: "Route 2",
      price: 234,
      size: 8,
      linktolocation:' https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
      description: dummyText,
      color: Color(0xFFD3A984)),
  MapLoc(
      id: 3,
      title: "Route 3",
      price: 234,
      linktolocation:' https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
      size: 10,
      description: dummyText,

      color: Color(0xFF989493)),
  MapLoc(
      id: 4,
      title: "Route 4",
      price: 234,
      linktolocation:' https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
      size: 11,
      description: dummyText,

      color: Color(0xFFE6B398)),
  MapLoc(
      id: 5,
      title: "Route 5",
      price: 234,
      size: 12,
      linktolocation:' https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
      description: dummyText,

      color: Color(0xFFFB7883)),
  MapLoc(
    id: 6,
    title: "Route 6",
    price: 234,
    size: 12,
    linktolocation:' https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
    description: dummyText,

    color: Color(0xFFAEAEAE),
  ),
  MapLoc(
    id: 6,
    title: "Route 6",
    price: 234,
    size: 12,
    linktolocation:'https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
    description: dummyText,

    color: Color(0xFFAEAEAE),
  ),MapLoc(
    id: 6,
    title: "Route 6",
    price: 234,
    size: 12,
    linktolocation:' https://maps.app.goo.gl/C6e7jUbNTppUfqWq5',
    description: dummyText,

    color: Color(0xFFAEAEAE),
  ),


];

String dummyText =
    "The Samruddhi Mahamarg is a state-of-the-art expressway connecting Shirdi to Nagpur, offering travelers a seamless journey between these two significant cities. This route ensures efficient travel with well-maintained roads, modern amenities, and advanced traffic management systems. Commuters can expect a smooth and comfortable drive, passing through picturesque landscapes and rural areas, before reaching the bustling city of Nagpur.";