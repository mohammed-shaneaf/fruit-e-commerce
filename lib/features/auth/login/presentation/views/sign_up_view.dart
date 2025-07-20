import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/common/methods/build_app_bar.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context, 'Sign Up'));
  }
}
