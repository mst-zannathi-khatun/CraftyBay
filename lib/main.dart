import 'package:craftybay/ui/state_managers/bottom_navigation_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/screens/splash_screen.dart';

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
              ))),
    );
  }
}

class GetXBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
  }
}
