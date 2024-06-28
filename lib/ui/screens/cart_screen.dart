import 'package:craftybay/widgets/common_elevatedbutton_widget.dart';
import 'package:craftybay/widgets/common_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_cart_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Review"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CommonTextFormFieldWidget(
              validator: (value) {},
              controller: TextEditingController(),
              hintText: "First Name",
            ),
            const SizedBox(
              height: 8,
            ),
            CommonTextFormFieldWidget(
              validator: (value) {},
              controller: TextEditingController(),
              hintText: "Last Name",
            ),
            const SizedBox(
              height: 8,
            ),
            CommonTextFormFieldWidget(
              validator: (value) {},
              controller: TextEditingController(),
              hintText: "Write Reviews",
              maxLines: 8,
            ),
            const SizedBox(
              height: 16,
            ),
            CommonElevatedButtonWidget(
              title: 'Submit',
              onTap: () {
                Get.to(const AddCartScreen());
              },
            )
          ],
        ),
      ),
    );
  }
}
