import 'package:flutter/material.dart';

class CustomAppBarIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const CustomAppBarIcon({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        width: 35,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white.withOpacity(0.05)),
        child: Icon(icon),
      ),
    );
  }
}
