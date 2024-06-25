import 'package:craftybay/ui/state_managers/bottom_navigation_bar_controller.dart';
import 'package:craftybay/ui/state_managers/categorys_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/appcolors.dart';
import '../state_managers/home_controller.dart';
import '../state_managers/popular_product_by_remark_controller.dart';
import '../state_managers/new_product_by_remark_controller.dart';
import '../state_managers/product_controller.dart';
import '../state_managers/special_product_by_remark_controller.dart';
import 'cart_screen.dart';
import 'category_screen.dart';
import 'home_screen.dart';
import 'wishlist_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  // final BottomNavigationBarController _navigationBarController =
  //     Get.put(BottomNavigationBarController());
  final List<Widget> _screen = const [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    Get.find<HomeController>().getHomeSlider();
    Get.find<CategoryController>().getCategory();
    Get.find<PopularProductController>().getPopularProductsByRemark();
    Get.find<NewProductController>().getNewProducts();
    Get.find<SpecialProductController>().getSpecialProduct();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationBarController>(builder: (controller) {
        return _screen[controller.selectedIndex];
      }),
      bottomNavigationBar:
          GetBuilder<BottomNavigationBarController>(builder: (controller) {
        return BottomNavigationBar(
          onTap: (value) {
            print(value);
            controller.changeIndex(value);
          },
          currentIndex: controller.selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: softGreyColor,
          showUnselectedLabels: true,
          elevation: 4,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view), label: "Category"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "WishList"),
          ],
        );
      }),
    );
  }
}
