import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_e_commerce/core/services/data_base_service.dart';

class FirebaseFirestoreService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }
}
