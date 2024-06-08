import 'package:craftybay/utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/homewidgets/appbar_iconbutton_widget.dart';
import '../../widgets/homewidgets/home_carouselslider_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              SvgPicture.asset('assets/images/logo_nav.svg'),
              const Spacer(),
              AppBarIconButton(
                iconData: Icons.person,
                onTap: () {},
              ),
              AppBarIconButton(
                iconData: Icons.call,
                onTap: () {},
              ),
              AppBarIconButton(
                iconData: Icons.notifications,
                onTap: () {},
              ),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 39,
              child: TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                onSubmitted: (value) {},
                decoration: InputDecoration(
                  fillColor: softGreyColor.withOpacity(0.1),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: softGreyColor,
                  ),
                  filled: true,
                  hintText: "Search",
                  hintStyle: TextStyle(
                      color: softGreyColor.withOpacity(0.2), fontSize: 15),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            HomeCarouselSliderWidget()
          ],
        ),
      ),
    );
  }
}
