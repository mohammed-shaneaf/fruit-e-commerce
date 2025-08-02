import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';
import 'package:fruit_e_commerce/features/home/presentation/views/widgets/featured_item_button.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width - 20 ;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: SizedBox(
          width: itemWidth,
          child: AspectRatio(
            aspectRatio: 342 / 158,
            child: Stack(
              // clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  // right: 50.w,
                  child: Image.asset(Assets.assetsImagesFeaturedFruitItem),
                ),
                Container(
                  width: itemWidth * 0.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: Svg(Assets.assetsImagesFeaturedItemShape),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      25.verticalSpace,
                      Text(
                        'عروض العيد',
                        style: AppTextStyles.regular13.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'خصم 25%',
                        style: AppTextStyles.bold19.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      11.verticalSpace,
                      FeaturedItemButton(onPressed: () {}),
                      29.verticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
