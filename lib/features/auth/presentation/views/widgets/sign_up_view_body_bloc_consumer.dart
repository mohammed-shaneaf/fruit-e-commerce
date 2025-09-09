import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_e_commerce/common/widgets/custom_spinkit_indicator.dart';
import 'package:fruit_e_commerce/core/extensions/navigation_extensions.dart';
import 'package:fruit_e_commerce/core/utils/awesome_snack_bar.dart';
import 'package:fruit_e_commerce/features/auth/presentation/manager/signup/signup_cubit.dart';
import 'package:fruit_e_commerce/features/auth/presentation/manager/signup/signup_state.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listenWhen: (previous, current) => current is SignupSuccess || current is SignupError,
      listener: (context, state) {
        if (state is SignupSuccess) {
          showAwesomeSnackBar(
            context: context,
            title: 'Sign Up Success',
            message: 'Welcome ${state.userEntity.name}',
            contentType: ContentType.success,
          );

          Future.delayed(const Duration(milliseconds: 1200), () {
            context.pop();
          });
        } else if (state is SignupError) {
          showAwesomeSnackBar(context: context, title: 'Sign Up Failed', message: state.message, contentType: ContentType.failure);
        }
      },
      builder: (context, state) {
        final isLoading = state is SignupLoading;

        return Stack(
          children: [
            const SignUpViewBody(),

            // Loading overlay
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
