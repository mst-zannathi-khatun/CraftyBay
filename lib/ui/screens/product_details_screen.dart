import 'package:craftybay/ui/state_managers/auth_controller.dart';
import 'package:craftybay/ui/state_managers/cart_controller.dart';
import 'package:craftybay/ui/state_managers/product_detailsbyid_controller.dart';
import 'package:craftybay/ui/state_managers/wish_list_controller.dart';
import 'package:craftybay/utils/style.dart';
import 'package:craftybay/widgets/common_elevatedbutton_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/appcolors.dart';
import '../../widgets/product_details/product_image_carousel.dart';
import '../../widgets/product_steper_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Color> colors = [];
  List<String> sizes = [];

  Color? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    super.initState();
    Get.find<ProductDetailsByIDController>()
        .getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: GetBuilder<ProductDetailsByIDController>(
          builder: (productdetailsbyidcontroller) {
            if (productdetailsbyidcontroller.productDetailsInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final productDetails =
                productdetailsbyidcontroller.productDetailsModel.data!.first;
            sizes = getSizes(productDetails.size ?? '');
            colors = getColors(productDetails.color ?? '');
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProductImageCarousel(
                          images: [
                            productDetails.img1 ?? '',
                            productDetails.img2 ?? '',
                            productDetails.img3 ?? '',
                            productDetails.img4 ?? '',
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          productDetails.product?.title ??
                                              'Unknown',
                                          style:
                                          titleTextStyle.copyWith(fontSize: 15),
                                        ),
                                        Row(
                                          children: [
                                            Wrap(
                                              crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 16,
                                                ),
                                                Text(
                                                  "${productDetails.product
                                                      ?.star ?? 0}",
                                                  style: const TextStyle(
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
                                            GetBuilder<WishListController>(
                                                builder: (wishlistcontroller) {
                                                  if (wishlistcontroller
                                                      .addNewInProgress) {
                                                    return const CircularProgressIndicator();
                                                  }
                                                  return InkWell(
                                                    onTap: () {
                                                      Get.find<
                                                          WishListController>()
                                                          .addToWishlist(
                                                          productDetails
                                                              .productId!);
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: primaryColor,
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                      ),
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(
                                                            4),
                                                        child: Icon(
                                                          Icons.favorite_border,
                                                          size: 11,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                })
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
                                        if (_selectedColor != color) {
                                          _selectedColor = color;
                                          if (mounted) {
                                            setState(() {});
                                          }
                                        }
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: color,
                                        radius: 15,
                                        child: Visibility(
                                          visible: color == _selectedColor,
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
                                            borderRadius: BorderRadius.circular(
                                                6),
                                            border: Border.all(
                                                color: greyColor),
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
                              Text(productDetails.product?.shortDes ??
                                  "Unknown"),
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
                        Column(
                          children: [
                            const Text(
                              "Price",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: greyColor),
                            ),
                            Text(
                              productDetails.product?.price ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        GetBuilder<CartController>(builder: (cartcontroller) {
                          if (cartcontroller.addToCartInProgress) {
                            return const CircularProgressIndicator();
                          }
                          return SizedBox(
                            width: 150,
                            child: CommonElevatedButtonWidget(
                              onTap: () async {
                                final result = await Get.find<AuthController>()
                                    .checkAuthValidation();
                                if (result) {
                                  if (_selectedSize != null &&
                                      _selectedColor != null) {
                                    Get.find<CartController>().addToCart(
                                      productDetails.productId!,
                                      _selectedSize!,
                                      _getHexCode(_selectedColor!),
                                    );
                                  }
                                } else {
                                  Get.showSnackbar(const GetSnackBar(
                                    title: "Select color size",
                                    message: "You have to select color and size",
                                    duration: Duration(seconds: 2),
                                  ));
                                }
                              },
                              title: "Add to card",
                            ),
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  List<String> getSizes(String size) {
    return size.split(',');
  }

  List<Color> getColors(String color) {
    List<Color> hexColors = [];
    List<String> colors = color.split(',');
    for (String c in colors) {
      c = c.replaceAll('#', '0xFF');
      hexColors.add(Color(int.parse(c)));
    }
    return hexColors;
  }

  String _getHexCode(Color color) {
    return color
        .toString()
        .replaceAll('0xff', '#')
        .replaceAll('Color(', '')
        .replaceAll(')', '');
  }
}
