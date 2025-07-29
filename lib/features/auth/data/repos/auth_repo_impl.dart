import 'dart:developer' as developer;

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_e_commerce/core/errors/exceptions.dart';
import 'package:fruit_e_commerce/core/errors/failure.dart';
import 'package:fruit_e_commerce/core/services/data_base_service.dart';
import 'package:fruit_e_commerce/core/services/firebase_auth_service.dart';
import 'package:fruit_e_commerce/core/utils/backend_endpoints.dart';
import 'package:fruit_e_commerce/features/auth/data/models/user_model.dart';
import 'package:fruit_e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_e_commerce/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;

  AuthRepoImpl({required this.firebaseAuthService, required this.dataBaseService});

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    developer.log("Attempting to create user: $email", name: 'AuthRepoImpl');

    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      var userEntity = UserEntity(name: name, email: email, uId: user!.uid);
      await addUserData(user: userEntity);

      developer.log("User creation successful: ${user.uid}", name: 'AuthRepoImpl');
      return Right(userEntity);
    } on CustomAuthException catch (e) {
      await deleteUserRecord(user);
      developer.log("CustomAuthException: ${e.message}", level: 1000, name: 'AuthRepoImpl');
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUserRecord(user);
      developer.log("Unexpected error during user creation: $e", level: 1000, name: 'AuthRepoImpl');
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<void> deleteUserRecord(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(String email, String password) async {
    developer.log("Attempting sign-in for user: $email", name: 'AuthRepoImpl');
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(email: email, password: password);
      developer.log("User sign-in successful: ${user?.uid}", name: 'AuthRepoImpl');
      return Right(UserModel.fromFirebaseUser(user!));
    } on CustomAuthException catch (e) {
      developer.log("CustomAuthException during sign-in: ${e.message}", level: 1000, name: 'AuthRepoImpl');
      return Left(ServerFailure(e.message));
    } catch (e) {
      developer.log("Unexpected error during sign-in: $e", level: 1000, name: 'AuthRepoImpl');
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithGoogle() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithGoogle();

      var userEntity = UserModel.fromFirebaseUser(user.user!);
      await addUserData(user: UserModel.fromFirebaseUser(user.user!));
      return Right(userEntity);
    } on CustomAuthException catch (e) {
      await deleteUserRecord(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    // throw CustomAuthException('Something Wrong Happend , try again latter');
    await dataBaseService.addData(path: BackendEndpoints.addUserData, data: user.toMap());
  }
}
