import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(4, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const FeaturedItem(),
            );
          }),
        ],
      ),
    );
  }
}

// why we are using ... spread operator
// to unpacke list<padding> in List<Widget>
// cause we need to return List<Widget>
// and Row expects List<Widget> not List<padding>
