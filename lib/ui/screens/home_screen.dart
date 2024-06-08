import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/appbar_iconbutton_widget.dart';

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
    );
  }
}

