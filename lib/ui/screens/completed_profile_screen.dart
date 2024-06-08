import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/style.dart';
import '../../widgets/common_elevatedbutton_widget.dart';
import '../../widgets/common_textformfield_widget.dart';

class CompletedProfileScreen extends StatefulWidget {
  const CompletedProfileScreen({super.key});

  @override
  State<CompletedProfileScreen> createState() => _CompletedProfileScreenState();
}

class _CompletedProfileScreenState extends State<CompletedProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/logo.svg",
              width: 100,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Complete Profile",
              style: titleTextStyle,
            ),
            Text(
              "Get started with us with your details",
              style: subTitleTextStyle,
            ),
            const SizedBox(
              height: 24,
            ),
            CommonTextFormFieldWidget(
              validator: (value) {},
              controller: TextEditingController(),
              hintText: "First Name",
            ),
            const SizedBox(
              height: 4,
            ),
            CommonTextFormFieldWidget(
              validator: (value) {},
              controller: TextEditingController(),
              hintText: "Last Name",
            ),
            const SizedBox(
              height: 4,
            ),
            CommonTextFormFieldWidget(
              validator: (value) {},
              controller: TextEditingController(),
              hintText: "Mobile",
            ),
            const SizedBox(
              height: 4,
            ),
            CommonTextFormFieldWidget(
              validator: (value) {},
              controller: TextEditingController(),
              hintText: "City",
            ),
            const SizedBox(
              height: 4,
            ),
            CommonTextFormFieldWidget(
              validator: (value) {},
              controller: TextEditingController(),
              hintText: "Shipping",
            ),
            const SizedBox(
              height: 16,
            ),
            CommonElevatedButtonWidget(
              title: "Complete",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
