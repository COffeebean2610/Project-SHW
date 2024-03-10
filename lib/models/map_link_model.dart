import 'package:cloud_firestore/cloud_firestore.dart';

class MapLink {
  final String id; // Document ID
  final String link;

  MapLink({required this.id, required this.link});

  // Factory method to create a MapLink  instance from Firestore data

}
class MapLinkService {
  final db = FirebaseFirestore.instance;

  Future<String> getMapLink(String mapLink) async {
    var snapshot = await db.collection('mapLinks').doc(mapLink).get();
    if (snapshot.exists) {
      // Check if the document exists
      return snapshot.data()?['link'] ?? '';
    } else {
      return '';
    }
  }
// void someFunction() async{
//     String mapLink = await getMapLink();
//
// }
}


