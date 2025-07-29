import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_e_commerce/core/services/data_base_service.dart';

class FirebaseFirestoreService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data}) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<Map<String, dynamic>> getData({required String path, required String doucmnetId}) async {
    var data = await firestore.collection(path).doc(doucmnetId).get();

    return data.data() as Map<String, dynamic>;
  }
}
