import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_shw/models/map_link_model.dart';

class MapLoc {
  final String id;
  final String title;
  final String description;
  final String linktolocation;
  final Color color;

  MapLoc({
    required this.id,
    required this.title,
    required this.description,
    required this.linktolocation,
    required this.color,
  });
}
MapLinkService mapLinkService = MapLinkService();

class MapLinksModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName;

  MapLinksModel(this.collectionName);

  // Future<List<MapLoc>> fetchMapLinks() async {
  //   QuerySnapshot<Map<String, dynamic>> querySnapshot =
  //   await _firestore.collection(collectionName).get();
  //   return querySnapshot.docs.map((doc) {
  //     final data = doc.data();
  //     return MapLoc(
  //       id: doc.id,
  //       title: data['title'] ?? '',
  //       description: data['description'] ?? '',
  //       linktolocation: data['linktolocation'] ?? '',
  //       color:Colors.cyan// Color(int.parse(data['color'], radix: 16)),
  //     );
  //   }).toList();
  // }
}
