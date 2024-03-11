import 'package:flutter/material.dart';
import 'package:project_shw/models/map_link_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
MapLinkService mapLinkService = MapLinkService();
class MapLoc {
  final String  title, description,linktolocation;
  final String  id;
  final Color color;
  MapLinksModel mapLinksModel = MapLinksModel('mapLinks');
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
      id: 'nagtoshir',
      title: "Khrud to Nagpur",

      description: dummyText,

      color: const Color(0xFF3D82AE)),

  MapLoc(
      id: 'nagtosindhidp',
      title: "Nagpur to Sindhi dry port",

      linktolocation:'',

      description: dummyText,

      color:const Color(0xFF989493)),
  MapLoc(
      id: 'nagtowardha',
      title: "Nagpur to Wardha",

      linktolocation:'',

      description: dummyText,

      color:const Color(0xFFE6B398)),
  MapLoc(
      id: 'nagtoarvi',
      title: "nagpur to Arvi",


      linktolocation:'',
      description: dummyText,

      color:const Color(0xFFFB7883)),
  MapLoc(
    id: 'nagtodmg',
    title: "Nagpur to Dhamangaon",


    linktolocation:'',
    description: dummyText,

    color: const Color(0xFFAEAEAE),
  ),
  MapLoc(
    id: 'nagtoymav',
    title: "Nagpur to Yavatmal-Amravati",


    linktolocation:'',
    description: dummyText,

    color:const Color(0xFFD3A984),
  ),
  MapLoc(
    id: 'nagtokrnjl',
    title: "Nagpur to Karanja Lad",


    linktolocation:'',
    description: dummyText,

    color:const Color(0xFFAEAEAE),
  ),
  MapLoc(
    id: 'nagtoselbjr',
    title: "Nagpur to Seloo Bajar",


    linktolocation:'',
    description: dummyText,

    color:const Color(0xFFD3A984),
  ),
  MapLoc(
    id: 'nagtomaljahngir',
    title: "Nagpur to Malegaon-Jahangir",


    linktolocation:'',
    description: dummyText,

    color:const Color(0xFFD3A984),
  ),


];


class MapLinksModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName;

  MapLinksModel(this.collectionName);

  Future<List<Object?>> fetchMapLinks() async {
    QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();
    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}

//Future<String> getMapLink() async => mapLinkService.getMapLink();

String dummyText =

    "Khrud to Nagpur\n"
    "Petrol Pumps : 6\n"
    "Total Time :6 hr 57 min\n"
    "Total Distance : 599 km\n"
    "The petrol pumps are optional to visit.\n"
    "Prerequisites : You should be near the start point\n."
    "May your Journey be Safe.";

