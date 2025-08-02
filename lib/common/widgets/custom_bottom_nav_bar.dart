import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/common/widgets/nav_bar_item.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/bottom_nav_bar_entity.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Responsive width
      height: 70,
      decoration: _buildDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bottomNavBarEntityItems
            .asMap()
            .entries
            .map(
              (entry) => GestureDetector(
                onTap: () => setState(() => selectedIndex = entry.key),
                child: NavigationBarItem(
                  isSelcted: entry.key == selectedIndex,
                  bottomNavBarEntity: entry.value,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  ShapeDecoration _buildDecoration() {
    return const ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      shadows: [
        BoxShadow(
          color: Color(0x19000000),
          blurRadius: 25,
          offset: Offset(0, -2),
          spreadRadius: 0,
        ),
      ],
    );
  }
}
