import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';
import 'package:fruit_e_commerce/core/themes/app_colors_manger.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 230, // just test don't write fixed value for resposive
      decoration: ShapeDecoration(
        color: Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                16.verticalSpace,
                Image.asset(Assets.assetsImagesWatermelon),
                16.verticalSpace,
                ListTile(
                  title: Text(
                    'بطيخ',
                    textAlign: TextAlign.right,
                    style: AppTextStyles.semiBold16,
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '1000 ',
                          style: AppTextStyles.bold13.copyWith(
                            color: AppColorsManger.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: 'ليرة',
                          style: AppTextStyles.bold13.copyWith(
                            color: AppColorsManger.secondaryColor,
                          ),
                        ),
                        TextSpan(
                          text: ' / ',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'الكيلو',
                          style: AppTextStyles.bold13.copyWith(
                            color: AppColorsManger.lightSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: LayoutBuilder(
                    builder: (context, constraints) {
                      double size = constraints.maxWidth * 0.30;
                      return SizedBox(
                        width: size,
                        height: size,
                        child: FloatingActionButton(
                          backgroundColor: AppColorsManger.primaryColor,
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: size * 0.4,
                          ), // responsive icon
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
