import 'package:flutter/material.dart';

import '../../utils/appcolors.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 39,
      child: TextField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        onSubmitted: (value) {},
        decoration: InputDecoration(
          fillColor: softGreyColor.withOpacity(0.1),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          prefixIcon: const Icon(
            Icons.search,
            color: softGreyColor,
          ),
          filled: true,
          hintText: "Search",
          hintStyle: TextStyle(
              color: softGreyColor.withOpacity(0.2), fontSize: 15),
          enabledBorder:
          const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
