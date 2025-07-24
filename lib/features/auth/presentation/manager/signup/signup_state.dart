import 'package:flutter/foundation.dart';
import 'package:fruit_e_commerce/features/auth/domain/entities/user_entity.dart';

@immutable
abstract class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupError extends SignupState {
  final String message;
  SignupError({required this.message});
}

final class SignupSuccess extends SignupState {
  final UserEntity userEntity;
  SignupSuccess({required this.userEntity});
}
