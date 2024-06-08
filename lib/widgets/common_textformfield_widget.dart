import 'package:flutter/material.dart';
import '../utils/appcolors.dart';

class CommonTextFormFieldWidget extends StatelessWidget {
  const CommonTextFormFieldWidget({
    super.key,
    required this.validator,
    required this.controller,
    this.hintText,
    this.textInputType,
  });

  final Function(String?) validator;
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: (value) {
        return validator(value);
      },
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: softGreyColor.withOpacity(0.3)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor))),
    );
  }
}
