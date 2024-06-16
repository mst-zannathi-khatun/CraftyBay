import 'dart:developer';
import 'package:craftybay/ui/state_managers/user_auth_controller.dart';
import 'package:craftybay/utils/appcolors.dart';
import 'package:craftybay/widgets/common_elevatedbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../utils/style.dart';
import '../state_managers/bottom_navigation_bar_controller.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;

  const OTPVerificationScreen({super.key, required this.email});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpETController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserAuthController>(builder: (userAuthController) {
        return Padding(
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
                "Enter OTP Code",
                style: titleTextStyle,
              ),
              Text(
                "A 4 Digit OTP Code has been Sent",
                style: subTitleTextStyle,
              ),
              const SizedBox(
                height: 24,
              ),
              const SizedBox(
                height: 16,
              ),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                controller: _otpETController,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 45,
                  fieldWidth: 45,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  selectedColor: Colors.green,
                  activeColor: primaryColor,
                  inactiveColor: primaryColor,
                  inactiveFillColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {
                  log("Completed");
                },
                onChanged: (value) {
                  log(value);
                  setState(() {
                    //currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  log("Allowing to paste $text");
                  return true;
                },
                appContext: context,
              ),
              const SizedBox(
                height: 8,
              ),
              userAuthController.otpVerificationInProgress
                  ? const CircularProgressIndicator()
                  : CommonElevatedButtonWidget(
                      title: "Next",
                      onTap: () async {
                        final bool response =
                            await userAuthController.otpVerification(
                                widget.email, _otpETController.text);
                        if (response) {
                          Get.find<BottomNavigationBarController>().backToHome();
                        } else {
                          Get.showSnackbar(const GetSnackBar(
                            title: "Otp Verification Failed",
                            message: "check your opt again before enter",
                          ));
                        }
                      },
                    ),
              const SizedBox(
                height: 24,
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 13,
                    color: softGreyColor,
                  ),
                  text: "This code will be expire in ",
                  children: [
                    TextSpan(
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        text: "120s"),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Resend Code",
                    style: TextStyle(color: greyColor.withOpacity(0.6)),
                  ))
            ],
          ),
        );
      }),
    );
  }
}
