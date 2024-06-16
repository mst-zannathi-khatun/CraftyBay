import 'package:craftybay/ui/state_managers/user_auth_controller.dart';
import 'package:craftybay/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../widgets/common_elevatedbutton_widget.dart';
import '../../widgets/common_textformfield_widget.dart';
import 'otp_verification_screen.dart';

class EmailAddressVerificationScreen extends StatefulWidget {
  const EmailAddressVerificationScreen({super.key});

  @override
  State<EmailAddressVerificationScreen> createState() =>
      _EmailAddressVerificationScreenState();
}

class _EmailAddressVerificationScreenState
    extends State<EmailAddressVerificationScreen> {
  final TextEditingController _emailETController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _fromKey,
        child: GetBuilder<UserAuthController>(builder: (authController) {
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
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                  controller: _emailETController,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 16,
                ),
                authController.emailVerificationInProgress
                    ? const CircularProgressIndicator()
                    : CommonElevatedButtonWidget(
                        title: "Next",
                        onTap: () async {
                          if (_fromKey.currentState!.validate()) {
                            final bool response = await authController
                                .emailVerification(_emailETController.text);
                            if (response) {
                              Get.to(OTPVerificationScreen(
                                  email: _emailETController.text));
                            } else {
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Email Verification Fail")));
                              }
                            }
                          }
                        },
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
