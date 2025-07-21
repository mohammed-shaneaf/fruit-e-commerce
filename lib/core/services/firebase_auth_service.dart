import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_e_commerce/core/errors/exceptions.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword({required String email, required String password, required String name}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user == null) {
        throw CustomAuthException("فشل في إنشاء المستخدم.");
      }

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      throw CustomAuthException.fromFirebaseAuthException(e.code);
    }
  }
}
