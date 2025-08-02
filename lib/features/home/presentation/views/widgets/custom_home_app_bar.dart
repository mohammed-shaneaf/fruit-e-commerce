import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/common/widgets/notfication_widget.dart';
import 'package:fruit_e_commerce/core/style/app_text_style.dart';
import 'package:fruit_e_commerce/core/themes/app_colors_manger.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.ltr;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isRtl) _buildNotificationIcon(),
          _buildUserInfo(context, isRtl),
          if (!isRtl) _buildNotificationIcon(),
        ],
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return NotificationWidget();
  }

  Widget _buildUserInfo(BuildContext context, bool isRtl) {
    return Row(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundColor: AppColorsManger.primaryColor,
          child: Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: isRtl
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              'صباح الخير !..',
              style: AppTextStyles.regular16.copyWith(
                color: AppColorsManger.grayColor,
              ),
              textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            ),
            Text(
              'أحمد مصطفى',
              style: AppTextStyles.bold16,
              textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            ),
          ],
        ),
      ],
    );
  }
}

