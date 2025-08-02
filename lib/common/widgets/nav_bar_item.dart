import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/common/widgets/active_item.dart';
import 'package:fruit_e_commerce/common/widgets/in_active_item.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/bottom_nav_bar_entity.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelcted,
    required this.bottomNavBarEntity,
  });

  final bool isSelcted;
  final BottomNavBarEntity bottomNavBarEntity;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (child, animation) {
        return ScaleTransition(scale: animation, child: child);
      },
      child: isSelcted
          ? ActiveItem(
              key: const ValueKey('active'),
              image: bottomNavBarEntity.activeImage,
              text: bottomNavBarEntity.name,
            )
          : InActiveItem(
              key: const ValueKey('inactive'),
              image: bottomNavBarEntity.inActiveImage,
            ),
    );
  }
}
