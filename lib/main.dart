import 'package:craftybay/ui/state_managers/auth_controller.dart';
import 'package:craftybay/ui/state_managers/bottom_navigation_bar_controller.dart';
import 'package:craftybay/ui/state_managers/categorys_controller.dart';
import 'package:craftybay/ui/state_managers/home_controller.dart';
import 'package:craftybay/ui/state_managers/popular_product_by_remark_controller.dart';
import 'package:craftybay/ui/state_managers/new_product_by_remark_controller.dart';
import 'package:craftybay/ui/state_managers/user_auth_controller.dart';
import 'package:craftybay/ui/state_managers/user_profile_controller.dart';
import 'package:craftybay/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/state_managers/special_product_by_remark_controller.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetXBindings(),

      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      //darkTheme: ,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 1,
          titleTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            iconColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
    Get.put(UserAuthController());
    Get.put(AuthController());
    Get.put(UserProfileController());
    Get.put(HomeController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(NewProductController());
    Get.put(SpecialProductController());
  }
}
