import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fruit_e_commerce/core/extensions/navigation_extensions.dart';
import 'package:fruit_e_commerce/core/themes/app_colors_manger.dart';
import 'package:fruit_e_commerce/core/utils/awesome_snack_bar.dart';
import 'package:fruit_e_commerce/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:fruit_e_commerce/features/auth/presentation/manager/signup_cubit/signup_state.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpViewBodyBlocConsumer extends StatelessWidget {
  const SignUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          context.pop();
        }
        if (state is SignupError) {
          showAwesomeErrorSnackBar(context, 'Sign Up Failed', state.message);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            const SignUpViewBody(),
            if (state is SignupLoading)
              Container(
                color: Colors.black.withOpacity(0.4),
                child: const Center(child: SpinKitCircle(color: AppColorsManger.primaryColor, size: 80.0)),
              ),
          ],
        );
      },
    );
  }
}
