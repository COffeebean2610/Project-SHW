import 'package:flutter/material.dart';

class MapLoc {
  final String  title, description;
  final int price, size, id;
  final Color color;

  MapLoc(
      {
        required this.title,
        required this.description,
        required this.price,
        required this.size,
        required this.id,
        required this.color});
}

List<MapLoc> products = [
  MapLoc(
      id: 1,
      title: "Route 1",
      price: 234,
      size: 12,
      description: dummyText,

      color: Color(0xFF3D82AE)),
  MapLoc(
      id: 2,
      title: "Route 2",
      price: 234,
      size: 8,
      description: dummyText,
      color: Color(0xFFD3A984)),
  MapLoc(
      id: 3,
      title: "Route 3",
      price: 234,
      size: 10,
      description: dummyText,

      color: Color(0xFF989493)),
  MapLoc(
      id: 4,
      title: "Route 4",
      price: 234,
      size: 11,
      description: dummyText,

      color: Color(0xFFE6B398)),
  MapLoc(
      id: 5,
      title: "Route 5",
      price: 234,
      size: 12,
      description: dummyText,

      color: Color(0xFFFB7883)),
  MapLoc(
    id: 6,
    title: "Route 6",
    price: 234,
    size: 12,
    description: dummyText,

    color: Color(0xFFAEAEAE),
  ),
  MapLoc(
    id: 6,
    title: "Route 6",
    price: 234,
    size: 12,
    description: dummyText,

    color: Color(0xFFAEAEAE),
  ),MapLoc(
    id: 6,
    title: "Route 6",
    price: 234,
    size: 12,
    description: dummyText,

    color: Color(0xFFAEAEAE),
  ),


];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";