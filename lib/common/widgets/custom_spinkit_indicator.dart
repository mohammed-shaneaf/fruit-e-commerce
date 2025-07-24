import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fruit_e_commerce/core/themes/app_colors_manger.dart';

class CustomSpinKitIndicator extends StatelessWidget {
  const CustomSpinKitIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(color: AppColorsManger.primaryColor, size: 80.0);
  }
}
