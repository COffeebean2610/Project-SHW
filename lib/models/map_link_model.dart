import 'package:cloud_firestore/cloud_firestore.dart';

class MapLink {
  final String id; // Document ID
  final String link;

  MapLink({required this.id, required this.link});


}

class MapLinkService {
  final db = FirebaseFirestore.instance;

  Future<String> getMapLink(String mapLink) async {
    var snapshot = await db.collection('mapLinks').doc(mapLink).get();
    if (snapshot.exists) {

      return snapshot.data()?['link'] ?? '';
    } else {
      return '';
    }
  }

}
