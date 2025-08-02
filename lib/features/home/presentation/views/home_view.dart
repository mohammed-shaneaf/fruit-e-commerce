import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/common/widgets/custom_bottom_nav_bar.dart';
import 'package:fruit_e_commerce/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
