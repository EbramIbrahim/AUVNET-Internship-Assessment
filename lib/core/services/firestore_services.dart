import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  late FirebaseFirestore _firestore;

  FirestoreService() {
    _firestore = FirebaseFirestore.instance;
  }

  FirebaseFirestore get firestore => _firestore;

  Future<QuerySnapshot<Map<String, dynamic>>> getData(String collectionPath) async {
    final map = await _firestore
        .collection(collectionPath)
        .get()
        .timeout(const Duration(seconds: 30));

    return map;
  }

  Future<void> addData(String collectionPath, Map<String, dynamic> data) async {
    await _firestore
        .collection(collectionPath)
        .add(data)
        .timeout(const Duration(seconds: 60));
  }

  Future<void> updateData(
      String collectionPath,
      String playgroundId,
      Map<String, dynamic> data,
      ) async {
    await _firestore
        .collection(collectionPath)
        .doc(playgroundId)
        .update(data)
        .timeout(const Duration(seconds: 30));
  }

  Future<void> setData(
      String collectionPath,
      String playgroundId,
      Map<String, dynamic> data,
      ) async {
    await _firestore
        .collection(collectionPath)
        .doc(playgroundId)
        .set(data, SetOptions(merge: true))
        .timeout(const Duration(seconds: 30));
  }

}