import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/app/app_name.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruit_e_commerce/features/auth/presentation/views/sign_up_view.dart';
import 'package:fruit_e_commerce/features/home/presentation/views/home_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppName.signInView:
      return MaterialPageRoute(builder: (context) => const SignInView());

    case AppName.signupView:
      return MaterialPageRoute(builder: (context) => const SignUpView());

    case AppName.homeview:
      return MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))),
      );
  }
}
