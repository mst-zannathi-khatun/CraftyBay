import 'package:craftybay/ui/screens/email_address_verification_screen.dart';
import 'package:craftybay/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../state_managers/auth_controller.dart';
import 'bottom_navigationbar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(
      seconds: 1,
    )).then((value) async {
      final bool loginState = await Get.find<AuthController>().isLoggedIn();
      if (loginState) {
        Get.off(const BottomNavigationBarScreen());
      } else {
        Get.off(const EmailAddressVerificationScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Center(
            child: SvgPicture.asset(
              "assets/images/logo.svg",
              width: 100,
            ),
          )),
          CircularProgressIndicator(
            backgroundColor: primaryColor,
            color: softGreyColor.withOpacity(0.6),
          ),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "Version 2.0",
              style: TextStyle(
                color: greyColor,
                fontSize: 12,
                letterSpacing: 0.6,
              ),
            ),
          )
        ],
      ),
    );
  }
}
