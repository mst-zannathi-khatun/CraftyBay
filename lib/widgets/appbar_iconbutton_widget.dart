import 'package:flutter/material.dart';

import '../utils/appcolors.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key,
    required this.iconData,
    required this.onTap,
  });

  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      splashColor: primaryColor.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          radius: 14,
          child: Icon(
            iconData,
            size: 18,
            color: softGreyColor,
          ),
        ),
      ),
    );
  }
}
