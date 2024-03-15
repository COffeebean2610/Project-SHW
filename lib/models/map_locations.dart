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


