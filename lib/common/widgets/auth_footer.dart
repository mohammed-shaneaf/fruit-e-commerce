import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';
import 'package:fruit_e_commerce/core/themes/app_colors_manger.dart';

class AuthFooter extends StatelessWidget {
  final String primaryText;
  final String actionText;
  final VoidCallback onActionTap;

  const AuthFooter({
    super.key,
    required this.primaryText,
    required this.actionText,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return RichText(
      text: TextSpan(
        text: primaryText,
        style: AppTextStyles.semiBold16.copyWith(color: const Color(0xff949D9E)),
        children: [
          TextSpan(
            text: " $actionText",
            style: AppTextStyles.semiBold16.copyWith(color: AppColorsManger.lightPrimaryColor),
            recognizer: TapGestureRecognizer()..onTap = onActionTap,
          ),
        ],
      ),
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
    );
  }
}
