import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_e_commerce/features/auth/presentation/manager/signin/signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  Future<void> signinUser({required String email, required String password}) async {
    emit(SigninLoading());
    final result = await authRepo.signinWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(SigninFailure(message: failure.meesage)),
      (userEntity) => emit(SigninSuccess(userEntity: userEntity)));
  }
}
