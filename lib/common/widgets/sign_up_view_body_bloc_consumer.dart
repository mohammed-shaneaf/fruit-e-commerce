import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruit_e_commerce/features/auth/presentation/manager/signup_cubit/signup_state.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SignUpViewBody();
      },
    );
  }
}
