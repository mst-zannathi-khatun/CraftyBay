import 'package:craftybay/utils/appcolors.dart';
import 'package:flutter/material.dart';

import '../../widgets/product_steper_widget.dart';

class AddCartScreen extends StatelessWidget {
  const AddCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 125,
            width: double.infinity,
            child: Card(
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/demo_shoe.jpg",
                    height: 130,
                    width: 130
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            Text("Happy New Year Special Shoe"),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.delete))
                          ],
                        ),
                        Text("'Color: Red, Size: X'"),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$100",
                              style: TextStyle(color: primaryColor),
                            ),
                            Spacer(),
                            ProductSteper(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
