import 'package:craftybay/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../ui/screens/product_details_screen.dart';
import '../utils/appcolors.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: InkWell(
        onTap: () {
          Get.to( ProductDetailsScreen(productId: product.id!,));
        },
        borderRadius: BorderRadius.circular(10),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          // margin: EdgeInsets.zero,
          elevation: 3,
          shadowColor: primaryColor.withOpacity(0.3),
          child: Column(
            children: [
              Image.network(
                product.image ?? '',
                width: 140,
                height: 85,
                fit: BoxFit.scaleDown,
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: [
                    Text(product.title?? "Unknown",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                          color: greyColor.withOpacity(0.9),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          '\$${product.price}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                         Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            Text(
                              '\$${product.star ?? 0}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: softGreyColor,
                              ),
                            ),
                          ],
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
            ],
          ),
        ),
      ),
    );
  }
}
