import 'package:bloc/bloc.dart';
import 'package:fruit_e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_e_commerce/features/auth/presentation/manager/signup/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(String email, String password, String name) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(email, password, name);
    result.fold((failure) => emit(SignupError(message: failure.meesage)), (userEntity) => emit(SignupSuccess(userEntity: userEntity)));
  }
}
