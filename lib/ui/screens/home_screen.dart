import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/homewidgets/appbar_iconbutton_widget.dart';
import '../../widgets/homewidgets/category_card_widget.dart';
import '../../widgets/homewidgets/home_carouselslider_widget.dart';
import '../../widgets/homewidgets/remarks_title_widget.dart';
import '../../widgets/homewidgets/search_textfield_widget.dart';

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
            const SearchTextFieldWidget(),
            const SizedBox(
              height: 16,
            ),
            HomeCarouselSliderWidget(),
            const SizedBox(
              height: 8,
            ),
            RemarksTitleWidget(
              remarkTitleText: "Categories",
              onTap: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryCardWidget(
                    categoryCardTitle: "Electronic",
                  ),
                  CategoryCardWidget(
                    categoryCardTitle: "Food",
                  ),
                  CategoryCardWidget(
                    categoryCardTitle: "Fashion",
                  ),
                  CategoryCardWidget(
                    categoryCardTitle: "Furniture",
                  ),
                  CategoryCardWidget(
                    categoryCardTitle: "Shoe",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
