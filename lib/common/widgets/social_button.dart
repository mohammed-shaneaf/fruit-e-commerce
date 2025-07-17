import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.title,
     this.image,
    required this.onpressed,
  });

  final String title;
  final String? image;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: onpressed,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), // BorderRadius 16
            side: BorderSide(color: Color(0xFFDDDFDF), width: 1),
          ),
        ),
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          // leading: SvgPicture.asset(image, width: 24, height: 24),
          title: Text(title, style: AppTextStyles.bold16, textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
