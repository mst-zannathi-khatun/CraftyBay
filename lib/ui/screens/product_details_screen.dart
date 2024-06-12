import 'package:craftybay/utils/style.dart';
import 'package:flutter/material.dart';
import '../../utils/appcolors.dart';
import '../../widgets/product_details/product_image_carousel.dart';
import '../../widgets/product_steper_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Column(
        children: [
          ProductImageCarousel(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Happy New Year Special Deal Save 30%",
                        style: titleTextStyle.copyWith(fontSize: 15),
                      ),
                      Row(
                        children: [
                          const Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 16,
                              ),
                              Text(
                                "4.5",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: softGreyColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Reviews',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: primaryColor,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.favorite_border,
                                size: 11,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const ProductSteper(),
              ],
            ),
          ),

          const Text("Color"),
          const Text("Size"),
          const Text("Description"),
          const Text(
              "Reference site about lorem isup, giving information on it's  origins, as well as a random lipsum generatar reference site about lorem isum, giving information on it's origin as well a random lisum gender")
        ],
      ),
    );
  }
}

