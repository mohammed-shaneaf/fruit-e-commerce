import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/common/methods/build_app_bar.dart';
import 'package:fruit_e_commerce/features/auth/login/presentation/views/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'Sign In'),
      body: SafeArea(child: SignInViewBody()),
    );
  }
}
