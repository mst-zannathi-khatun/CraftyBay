import 'package:flutter/material.dart';

import '../../utils/appcolors.dart';
import '../../utils/style.dart';

class RemarksTitleWidget extends StatelessWidget {
  const RemarksTitleWidget({
    super.key,
    required this.remarkTitleText,
    required this.onTap,
  });

  final String remarkTitleText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          remarkTitleText,
          style: titleTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: blackColor,
          ),
        ),
        TextButton(
            onPressed: onTap,
            child: const Text(
              "See All",
              style: TextStyle(color: primaryColor),
            ))
      ],
    );
  }
}
