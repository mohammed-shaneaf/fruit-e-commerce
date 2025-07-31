import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';
import 'package:fruit_e_commerce/core/themes/app_colors_manger.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 32,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            minimumSize: const Size(double.infinity, 54),
            backgroundColor: AppColorsManger.whiteColor,
          ),

          onPressed: onPressed,
          child: Text(
            'تسوق الان',
            style: AppTextStyles.bold13.copyWith(
              color: AppColorsManger.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
