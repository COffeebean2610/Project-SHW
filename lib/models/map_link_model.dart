import 'package:cloud_firestore/cloud_firestore.dart';
class MapLink {
  final String id; // Document ID
  final String link;

  MapLink({required this.id, required this.link});

  // Factory method to create a MapLink instance from Firestore data
  factory MapLink.fromFirestore(Map<String, dynamic> data, String documentId) {
    return MapLink(
      id: documentId,
      link: data['link'] ?? '', // Access the 'link' field from Firestore data
    );
  }
}


class MapLinkService {
  final CollectionReference<Map<String, dynamic>> _mapLinksCollection =
  FirebaseFirestore.instance.collection('mapLinks');

  // Method to get a specific map link document by ID
  Future<String?> getMapLinkById(String documentId) async {
    try {
      var snapshot = await _mapLinksCollection.doc(documentId).get();
      if (snapshot.exists) {
        return MapLink.fromFirestore(snapshot.data() as Map<String, dynamic>, documentId).toString();
      } else {
        return null; // Document doesn't exist
      }
    } catch (e) {
      print("Error getting map link by ID: $e");
      return null;
    }
  }

  // Method to get all map link documents
  Future<List<MapLink>> getAllMapLinks() async {
    try {
      var querySnapshot = await _mapLinksCollection.get();
      return querySnapshot.docs
          .map((doc) => MapLink.fromFirestore(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      print("Error getting all map links: $e");
      return [];
    }
  }
}

