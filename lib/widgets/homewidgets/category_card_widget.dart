import 'package:flutter/material.dart';

import '../../utils/appcolors.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key, required this.categoryCardTitle,
  });
  final String categoryCardTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Padding(
              padding: EdgeInsets.all(14),
              child: Icon(
                Icons.computer,
                size: 40,
                color: primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            categoryCardTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: primaryColor,
              letterSpacing: 0.6,
            ),
          )
        ],
      ),
    );
  }
}
