import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_store/core/services/data_service.dart';

class FirestoreService implements DataService {
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
  }) async {
    if (documentId != null) {
      await FirebaseFirestore.instance
          .collection(path)
          .doc(documentId)
          .set(data);
    } else {
      await FirebaseFirestore.instance.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String documentId,
  }) async {
    var data = await FirebaseFirestore.instance
        .collection(path)
        .doc(documentId)
        .get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> checkDocumentExists({
    required String path,
    required String documentId,
  }) async {
    var data = await FirebaseFirestore.instance
        .collection(path)
        .doc(documentId)
        .get();

    return data.exists;
  }
}
