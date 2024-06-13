import 'package:craftybay/utils/style.dart';
import 'package:craftybay/widgets/common_elevatedbutton_widget.dart';
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
  List<Color> colors = const [
    Color(0xFF000000),
    Color(0xFFEC0606),
    Color(0xFF0C7A71),
    Color(0xFFFDB301),
    Color(0xFFC61FFA),
  ];

  List<String> sizes = [
    "S",
    "L",
    "XL",
    "XXL",
    "XXXL",
  ];

  Color _colorIndex = const Color(0xFF000000);
  String _selectedSize = 'L';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarousel(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Happy New Year Special Deal Save 30%",
                                    style:
                                        titleTextStyle.copyWith(fontSize: 15),
                                  ),
                                  Row(
                                    children: [
                                      const Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Color",
                          style: titleTextStyle.copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: colors.map((color) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  if (_colorIndex != color) {
                                    _colorIndex = color;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundColor: color,
                                  radius: 15,
                                  child: Visibility(
                                    visible: color == _colorIndex,
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Size",
                          style: titleTextStyle.copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: sizes.map((size) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  if (_selectedSize != size) {
                                    _selectedSize = size;
                                    if (mounted) {
                                      setState(() {});
                                    }
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(color: greyColor),
                                      color: size == _selectedSize
                                          ? primaryColor
                                          : null),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      size,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: size == _selectedSize
                                              ? Colors.white
                                              : null),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Description",
                          style: titleTextStyle.copyWith(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                            "Reference site about lorem isup, giving information on it's  origins, as well as a random lipsum generatar reference site about lorem isum, giving information on it's origin as well a random lisum gender"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                    width: 130,
                    child: CommonElevatedButtonWidget(
                      onTap: () {},
                      title: "Add to card",
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
