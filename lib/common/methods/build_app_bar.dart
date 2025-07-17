import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios, size: 18),
    ),
    backgroundColor: Colors.transparent,
    title: Text(title, style: AppTextStyles.bold19),
    centerTitle: true,
    actions: [
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 16),
      //   child: CustomNotificationWidget(),
      // ),
    ],
  );
}
