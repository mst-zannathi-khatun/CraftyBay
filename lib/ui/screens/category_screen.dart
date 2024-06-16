import 'package:craftybay/ui/state_managers/categorys_controller.dart';
import 'package:craftybay/widgets/category_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../state_managers/bottom_navigation_bar_controller.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
        leading: IconButton(
          onPressed: () {
            Get.find<BottomNavigationBarController>().backToHome();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GetBuilder<CategoryController>(builder: (categoryController) {
        if (categoryController.getCategoryInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryController>().getCategory();
          },
          child: GridView.builder(
            itemCount: categoryController.categoryModel.category?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4),
            itemBuilder: (context, index) {
              final category =
                  categoryController.categoryModel.category![index];
              return CategoryCardWidget(
                categoryCardTitle: category.categoryName.toString(),
                imageUrl: category.categoryImg.toString(),
              );
            },
          ),
        );
      }),
    );
  }
}
