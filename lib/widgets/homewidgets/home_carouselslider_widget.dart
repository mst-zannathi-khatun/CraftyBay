import 'package:carousel_slider/carousel_slider.dart';
import 'package:craftybay/data/models/home_sliders_model.dart';
import 'package:flutter/material.dart';
import '../../utils/appcolors.dart';

class HomeCarouselSliderWidget extends StatelessWidget {
  final HomeSlidersModel homeSlidersModel;
  ValueNotifier<int> currentCarouselIndex = ValueNotifier(0);

  HomeCarouselSliderWidget({
    super.key,
    required this.homeSlidersModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 170.0,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              onPageChanged: (index, _) {
                currentCarouselIndex.value = index;
              }),
          items: homeSlidersModel.sliders!.map((sliders) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(sliders.image ?? ''))),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 6,
        ),
        ValueListenableBuilder(
            valueListenable: currentCarouselIndex,
            builder: (context, currentValue, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0;
                      i < (homeSlidersModel.sliders?.length ?? 0);
                      i++)
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: currentValue == i ? primaryColor : null,
                            border:
                                Border.all(color: greyColor.withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                ],
              );
            }),
      ],
    );
  }
}
