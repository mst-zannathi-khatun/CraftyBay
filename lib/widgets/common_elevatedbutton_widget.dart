import 'package:flutter/material.dart';

import '../utils/appcolors.dart';

class CommonElevatedButtonWidget extends StatelessWidget {
  const CommonElevatedButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            )),
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            letterSpacing: 0.6,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
