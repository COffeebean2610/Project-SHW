import 'package:flutter/material.dart';

class Product {
  final String  title, description;
  final int price, size, id;
  final Color color;

  Product(
      {
        required this.title,
        required this.description,
        required this.price,
        required this.size,
        required this.id,
        required this.color});
}

List<Product> products = [
  Product(
      id: 1,
      title: "Route 1",
      price: 234,
      size: 12,
      description: dummyText,

      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Route 2",
      price: 234,
      size: 8,
      description: dummyText,
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Route 3",
      price: 234,
      size: 10,
      description: dummyText,

      color: Color(0xFF989493)),
  Product(
      id: 4,
      title: "Route 4",
      price: 234,
      size: 11,
      description: dummyText,

      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Route 5",
      price: 234,
      size: 12,
      description: dummyText,

      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Route 6",
    price: 234,
    size: 12,
    description: dummyText,

    color: Color(0xFFAEAEAE),
  ),
  Product(
    id: 6,
    title: "Route 6",
    price: 234,
    size: 12,
    description: dummyText,

    color: Color(0xFFAEAEAE),
  ),Product(
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