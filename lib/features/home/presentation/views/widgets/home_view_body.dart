import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_e_commerce/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:fruit_e_commerce/features/home/presentation/views/widgets/featured_list.dart';
import 'package:fruit_e_commerce/features/home/presentation/views/widgets/search_home_text_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomHomeAppBar(),
                16.verticalSpace,
                SearchHomeTextField(),
                12.verticalSpace,
                FeaturedList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
