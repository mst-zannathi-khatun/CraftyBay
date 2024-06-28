import 'package:flutter/material.dart';

import '../product_steper_widget.dart';

class CardProductItems extends StatelessWidget {
  const CardProductItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          Image.asset(
            'assets/images/demo_shoe.jpg',
            width: 120,
          ),
          const SizedBox(width: 8,),
          const Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Happy New Years Product Cards"),
                          SizedBox(height: 1,),
                          Row(
                            children: [
                              Text("Color: Grey"),
                              SizedBox(width: 8,),
                              Text("Size: XXl"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$200"),
                    ProductSteper(),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
