import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/errors/exceptions.dart';
import 'package:fruit_e_commerce/core/errors/failure.dart';
import 'package:fruit_e_commerce/core/services/firebase_auth_service.dart';
import 'package:fruit_e_commerce/features/auth/data/models/user_model.dart';
import 'package:fruit_e_commerce/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_e_commerce/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password, String name) async {
    await firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password, name: name);
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password, name: name);

      return Right(UserModel.fromFirebaseUser(user!));
    } on CustomAuthException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }

  }

}
