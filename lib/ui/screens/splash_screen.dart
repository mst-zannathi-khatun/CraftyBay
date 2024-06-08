import 'package:craftybay/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
