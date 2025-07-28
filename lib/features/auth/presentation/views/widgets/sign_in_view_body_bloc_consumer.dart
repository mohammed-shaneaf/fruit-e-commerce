import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/common/widgets/custom_spinkit_indicator.dart';
import 'package:fruit_e_commerce/core/utils/awesome_snack_bar.dart';
import 'package:fruit_e_commerce/features/auth/presentation/manager/signin/signin_cubit.dart';
import 'package:fruit_e_commerce/features/auth/presentation/manager/signin/signin_state.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/sign_in_view_body.dart';

class SigninViewBodyBlocCosnumer extends StatelessWidget {
  const SigninViewBodyBlocCosnumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          showAwesomeSnackBar(
            context: context,
            title: 'Sign In Success',
            message: 'Welcome ${state.userEntity.name}',
            contentType: ContentType.success,
          );
        }

        if (state is SigninFailure) {
          showAwesomeSnackBar(context: context, title: 'Sign In Failed', message: state.message, contentType: ContentType.failure);
        }
      },
      builder: (context, state) {
        final isLoading = state is SigninLoading;
        return Stack(
          children: [
            const SignInViewBody(),
            if (isLoading)
              AbsorbPointer(
                absorbing: true,
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: const Center(child: CustomSpinKitIndicator()),
                ),
              ),
          ],
        );
      },
    );
  }
}
