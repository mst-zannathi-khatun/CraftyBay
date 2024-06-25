import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/product_cart_widget.dart';
import '../state_managers/product_controller.dart';

class ProductListScreen extends StatefulWidget {
  final int categoryId;

  const ProductListScreen({super.key, required this.categoryId});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    Get.find<ProductController>().getProductCategory(widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: GetBuilder<ProductController>(builder: (productcontroller) {
        if (productcontroller.getProductControllerInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView.builder(
          itemCount: productcontroller.productByCategoryModel.product?.length ?? 0,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 0.75),
          itemBuilder: (context, index) {
            return ProductCardWidget(
              product: productcontroller.productByCategoryModel.product![index],
            );
          },
        );
      }),
    );
  }
}
