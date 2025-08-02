import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/app/app_name.dart';
import 'package:fruit_e_commerce/core/extensions/navigation_extensions.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppName.bestSellingView);
      },
      child: Row(
        children: [
          Text('الأكثر مبيعا', style: AppTextStyles.bold16),
          const Spacer(),
          Text(
            'المزيد',
            style: AppTextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),
          ),
        ],
      ),
    );
  }
}
