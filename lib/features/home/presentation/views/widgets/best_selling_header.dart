import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override

  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('الأكثر مبيعا', style: AppTextStyles.bold16),
        Spacer(),
        Text(
          'المزيد',
          style: AppTextStyles.regular13.copyWith(color: Color(0xFF949D9E)),
        ),
      ],
    );
  }
}
