import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/errors/failure.dart';
import 'package:fruit_e_commerce/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password, String name);

  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(String email, String password);

  Future<Either<Failure, UserEntity>> signinWithGoogle();

  // if you want to add data and this data is stored in database , it's recommended to use model to store the data and handle it with

  Future addUserData({required UserEntity user});

  Future<UserEntity> getUserData ({required String uId});
}
