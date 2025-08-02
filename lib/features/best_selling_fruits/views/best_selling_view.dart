import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/common/widgets/custom_app_bar.dart';
import 'package:fruit_e_commerce/features/best_selling_fruits/views/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'الأكثر مبيعًا'),
      body: BestSellingViewBody(),
    );
  }
}
