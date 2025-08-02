import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_e_commerce/core/themes/app_colors_manger.dart';
import 'package:fruit_e_commerce/core/utils/app_images.dart';

class SearchHomeTextField extends StatelessWidget {
  const SearchHomeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 9,
              offset: Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: TextFormField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                width: 32,
                Assets.assetsImagesSearch,

                fit: BoxFit.scaleDown,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                width: 32,
                Assets.assetsImagesFilter,
                fit: BoxFit.scaleDown,
              ),
            ),
            hintText: 'ابحث عن.......',
            hintStyle: const TextStyle(color: Color(0xff949D9E)),
            border: buildBorder(),
            focusedBorder: buildBorder(),
            enabledBorder: buildBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(color: AppColorsManger.grayColor, width: 1),
    );
  }
}
