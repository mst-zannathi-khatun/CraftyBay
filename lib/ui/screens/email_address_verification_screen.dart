import 'package:craftybay/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../widgets/common_elevatedbutton_widget.dart';
import '../../widgets/common_textformfield_widget.dart';
import 'otp_verification_screen.dart';

class EmailAddressVerificationScreen extends StatelessWidget {
  const EmailAddressVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 100,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Welcome Back",
              style: titleTextStyle,
            ),
            Text(
              "Please enter your email address",
              style: subTitleTextStyle,
            ),
            const SizedBox(
              height: 24,
            ),
            CommonTextFormFieldWidget(
              validator: (value) {},
              controller: TextEditingController(),
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 16,
            ),
            CommonElevatedButtonWidget(
              title: "Next",
              onTap: () {
                Get.to(const OTPVerificationScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
