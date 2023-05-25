import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
const CustomSearchIcon({super.key, required this.icon, this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.withOpacity(0.2)),
      child: Center(
          child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 28,
        ),
      )),
    );
  }
}
