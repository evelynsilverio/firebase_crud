import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_crud_5a25/models/pet_model.dart';

class FirestoreService {
  static final FirestoreService _instance = FirestoreService._internal();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  factory FirestoreService(){
    return _instance;
  }

  FirestoreService._internal();

  Stream<List<PetModel>> getPets(String collection){
    return _firestore.collection(collection).snapshots().map((snapshot){
      return snapshot.docs
      .map((doc) => PetModel.fromDocumentSnapshot(doc))
      .toList();
    });
  }

  Future<void> updatePet(
      String collection, String docid, Map<String, dynamic> data) {
    return _firestore.collection(collection).doc(docid).update(data);
  }

  Future<void> deletePet(String collection, String docid) {
    return _firestore.collection(collection).doc(docid).delete();
  }

  Future<void> addPet(String collection, Map<String, dynamic> data) {
    return _firestore.collection(collection).add(data);
  }
}