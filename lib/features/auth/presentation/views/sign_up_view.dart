import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/common/methods/build_app_bar.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';
import 'package:fruit_e_commerce/core/services/get_it_service.dart';
import 'package:fruit_e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_e_commerce/features/auth/presentation/manager/signup/signup_cubit.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, 'Sign Up'),
        body: SignUpViewBodyBlocConsumer(),
      ),
    );
  }
}
