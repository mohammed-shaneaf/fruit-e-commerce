import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/common/widgets/notfication_widget.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';

AppBar customAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(title, style: AppTextStyles.bold19),
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(Icons.arrow_back_ios, size: 18),
    ),

    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: const NotificationWidget(),
      ),
    ],
  );
}
