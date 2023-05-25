import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'constants.dart';
import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.icon,this.onPressed});

  final String text;
  final IconData icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
          Spacer(),
          CustomSearchIcon(
            icon: icon,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
