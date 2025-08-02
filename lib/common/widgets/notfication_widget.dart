import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffeef8ed),
      ),
      child: const Icon(
        Icons.notifications_none,
        color: Colors.black54,
        size: 24,
      ),
    );
  }
}
