import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/common/widgets/or_widget.dart';
import 'package:fruit_e_commerce/common/widgets/social_button.dart';

class AuthSocialButtons extends StatelessWidget {
  const AuthSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Orwidget(),
        16.verticalSpace,
        SocialButton(
        title : 'SignInWithGoogle',
          // image: Assets.imagesGoogleicon,
          onpressed: () {
            // context.read<SigninCubit>().signInWithGoogle();
          },
        ),
        16.verticalSpace,
        SocialButton(
          title: 'SignInWithApple',
          // image: Assets.imagesAppleicon,
          onpressed: () {},
        ),
        16.verticalSpace,
        SocialButton(
          title : 'SignInWithFecebook',
          // image: Assets.imagesFecebookicon,
          onpressed: () {
            // context.read<SigninCubit>().signInWithFecebook();
          },
        ),
        66.verticalSpace,
      ],
    );
  }
}
