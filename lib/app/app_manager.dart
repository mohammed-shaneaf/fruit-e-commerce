import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/app/app_name.dart';
import 'package:fruit_e_commerce/features/auth/login/presentation/views/sign_in_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppName.signInView:
      return MaterialPageRoute(builder: (context) => const SignInView());
    default:
      return MaterialPageRoute(
        builder: (context) =>
            Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))),
      );
  }
}
