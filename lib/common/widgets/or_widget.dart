import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';

class Orwidget extends StatelessWidget {
  const Orwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey)),
        18.horizontalSpace,
        Text('OR', style: AppTextStyles.semiBold16.copyWith(color: Colors.grey)),
        18.horizontalSpace,
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
}
