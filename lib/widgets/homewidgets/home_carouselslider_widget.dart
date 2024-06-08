import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../utils/appcolors.dart';

class HomeCarouselSliderWidget extends StatelessWidget {
  ValueNotifier<int> currentCarouselIndex = ValueNotifier(0);

  HomeCarouselSliderWidget({
    super.key,
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
              onPageChanged: (index, _) {
                currentCarouselIndex.value = index;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    alignment: Alignment.center,
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ));
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
                  for (int i = 0; i < 5; i++)
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