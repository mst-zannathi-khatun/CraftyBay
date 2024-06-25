import 'package:craftybay/ui/screens/email_address_verification_screen.dart';
import 'package:craftybay/ui/state_managers/auth_controller.dart';
import 'package:craftybay/ui/state_managers/bottom_navigation_bar_controller.dart';
import 'package:craftybay/ui/state_managers/categorys_controller.dart';
import 'package:craftybay/ui/state_managers/home_controller.dart';
import 'package:craftybay/ui/state_managers/popular_product_by_remark_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../widgets/homewidgets/appbar_iconbutton_widget.dart';
import '../../widgets/category_card_widget.dart';
import '../../widgets/homewidgets/home_carouselslider_widget.dart';
import '../../widgets/homewidgets/remarks_title_widget.dart';
import '../../widgets/homewidgets/search_textfield_widget.dart';
import '../../widgets/product_cart_widget.dart';
import '../state_managers/new_product_by_remark_controller.dart';
import '../state_managers/special_product_by_remark_controller.dart';
import 'completed_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              SvgPicture.asset('assets/images/logo_nav.svg'),
              const Spacer(),
              AppBarIconButton(
                iconData: Icons.person,
                onTap: () {
                  Get.find<AuthController>().isLoggedIn().then((value) {
                    if (value) {
                      Get.to(const CompletedProfileScreen());
                    } else {
                      Get.to(const EmailAddressVerificationScreen());
                    }
                  });
                },
              ),
              AppBarIconButton(
                iconData: Icons.call,
                onTap: () {},
              ),
              AppBarIconButton(
                iconData: Icons.notifications,
                onTap: () {},
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchTextFieldWidget(),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeController>(builder: (homeController) {
                if (homeController.getSliderInProgress) {
                  return const SizedBox(
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return HomeCarouselSliderWidget(
                  homeSlidersModel: homeController.homeSlidersModel,
                );
              }),
              const SizedBox(
                height: 8,
              ),
              RemarksTitleWidget(
                remarkTitleText: "Categories",
                onTap: () {
                  Get.find<BottomNavigationBarController>().changeIndex(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<CategoryController>(builder: (categoryController) {
                if (categoryController.getCategoryInProgress) {
                  return const SizedBox(
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: categoryController.categoryModel.category!
                          .map(
                            (e) => CategoryCardWidget(
                              categoryCardTitle: e.categoryName.toString(),
                              imageUrl: e.categoryImg.toString(),
                            ),
                          )
                          .toList()),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarkTitleText: "Popular",
                onTap: () {},
              ),
              GetBuilder<PopularProductController>(
                  builder: (productByRemarkController) {
                if (productByRemarkController
                    .getProductByRemarkModelInProgress) {
                  return const SizedBox(
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children:
                          productByRemarkController.popularProduct.product!
                              .map(
                                (products) => ProductCardWidget(
                                  product: products,
                                ),
                              )
                              .toList()),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarkTitleText: "Special",
                onTap: () {},
              ),
              GetBuilder<SpecialProductController>(
                  builder: (specialproductcontroller) {
                if (specialproductcontroller.specialProductInProgress) {
                  return const SizedBox(
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: specialproductcontroller.specialProduct.product!
                          .map(
                            (products) => ProductCardWidget(
                              product: products,
                            ),
                          )
                          .toList()),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              RemarksTitleWidget(
                remarkTitleText: "New",
                onTap: () {},
              ),
              GetBuilder<NewProductController>(builder: (newproductcontroller) {
                if (newproductcontroller.newProductControllerInProgress) {
                  return const SizedBox(
                    height: 90,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: newproductcontroller.newProductModel.product!
                          .map(
                            (products) => ProductCardWidget(
                              product: products,
                            ),
                          )
                          .toList()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
