import 'dart:developer' as developer;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_e_commerce/core/errors/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword({required String email, required String password, required String name}) async {
    developer.log("Creating user with email: $email", name: 'FirebaseAuthService');
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user == null) {
        developer.log("User creation failed: userCredential.user is null", level: 1000, name: 'FirebaseAuthService');
        throw CustomAuthException("فشل في إنشاء المستخدم.");
      }

      developer.log("User created: ${userCredential.user!.uid}", name: 'FirebaseAuthService');
      return userCredential.user;
    } on FirebaseAuthException catch (e, stackTrace) {
      developer.log("FirebaseAuthException caught: ${e.code}", error: e, stackTrace: stackTrace, level: 1000, name: 'FirebaseAuthService');
      throw CustomAuthException.fromFirebaseAuthException(e.code);
    }
  }

  Future<User?> signInWithEmailAndPassword({required String email, required String password}) async {
    developer.log("Signing in with email: $email", name: 'FirebaseAuthService');
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      developer.log("User signed in: ${userCredential.user?.uid}", name: 'FirebaseAuthService');
      return userCredential.user;
    } on FirebaseAuthException catch (e, stackTrace) {
      developer.log(
        "FirebaseAuthException caught during sign in: ${e.code}",
        error: e,
        stackTrace: stackTrace,
        level: 1000,
        name: 'FirebaseAuthService',
      );
      throw CustomAuthException.fromFirebaseAuthException(e.code);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
