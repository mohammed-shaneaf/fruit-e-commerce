import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';
import 'package:fruit_e_commerce/core/themes/app_colors_manger.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          color: const Color(0xffeeeeee),
        ),
        child: Row(
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: AppColorsManger.primaryColor,
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),

            6.horizontalSpace,
            Text(
              text,
              style: AppTextStyles.semiBold11.copyWith(
                color: AppColorsManger.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
