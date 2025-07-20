import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';
import 'package:fruit_e_commerce/core/themes/app_colors_manger.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return Row(
      children: [
        if (isRtl) const Spacer(),
        Text(
          'Forgot Password?',
          style: AppTextStyles.semiBold13.copyWith(color: AppColorsManger.lightPrimaryColor),
        ),
        if (!isRtl) const Spacer(),
      ],
    );
  }
}
