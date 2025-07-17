import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/app/app_manager.dart';
import 'package:fruit_e_commerce/app/app_name.dart';

class FruitECommerce extends StatelessWidget {
  const FruitECommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        initialRoute: AppName.signInView,
      ),
    );
  }
}
