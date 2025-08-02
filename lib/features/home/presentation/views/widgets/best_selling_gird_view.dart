import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/common/widgets/fruit_item.dart';

class BestSellingGirdView extends StatelessWidget {
  const BestSellingGirdView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 170 / 250,
        mainAxisSpacing: 20,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => const FruitItem(),
    );
  }
}
