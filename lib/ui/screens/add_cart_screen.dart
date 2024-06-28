import 'package:flutter/material.dart';
import '../../utils/appcolors.dart';
import '../../widgets/cart/add_to_cart_widget.dart';
import '../../widgets/common_elevatedbutton_widget.dart';

class AddCartScreen extends StatelessWidget {
  const AddCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
                itemBuilder: (context, index) {
              return const CardProductItems();
            }),
          ),
          Container(
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.15),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                       Text(
                        "Price",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: greyColor),
                      ),
                      Text(
                        "\$100",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 150,
                    child: CommonElevatedButtonWidget(
                      onTap: () {},
                      title: "Checkout",
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
