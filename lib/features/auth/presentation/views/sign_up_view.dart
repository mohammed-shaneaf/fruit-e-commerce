import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/common/methods/build_app_bar.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context, 'Sign Up'), body: SignUpViewBody());
  }
}
