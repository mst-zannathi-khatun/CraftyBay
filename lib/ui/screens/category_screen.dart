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
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: GridView.builder(
          itemCount: 15,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          itemBuilder: (context, index) {
            return const CategoryCardWidget(categoryCardTitle: "Dummy");
          }),
    );
  }
}
