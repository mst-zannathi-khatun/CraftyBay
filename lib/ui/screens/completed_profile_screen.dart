import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/style.dart';
import '../../widgets/common_elevatedbutton_widget.dart';
import '../../widgets/common_textformfield_widget.dart';
import '../state_managers/user_auth_controller.dart';

class CompletedProfileScreen extends StatefulWidget {
  const CompletedProfileScreen({super.key});

  @override
  State<CompletedProfileScreen> createState() => _CompletedProfileScreenState();
}

class _CompletedProfileScreenState extends State<CompletedProfileScreen> {
  final TextEditingController _firstNameETController = TextEditingController();
  final TextEditingController _lastNameETController = TextEditingController();
  final TextEditingController _mobileNameETController = TextEditingController();
  final TextEditingController _cityNameETController = TextEditingController();
  final TextEditingController _shippingNameETController = TextEditingController();
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _fromKey,
        child: GetBuilder<UserAuthController>(builder: (authController) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
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
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter you first name";
                      }
                      return null;
                    },
                    controller: _firstNameETController,
                    hintText: "First Name",
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CommonTextFormFieldWidget(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your last name";
                      }
                      return null;
                    },
                    controller: _lastNameETController,
                    hintText: "Last Name",
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CommonTextFormFieldWidget(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your mobile number";
                      }
                      return null;
                    },
                    controller: _mobileNameETController,
                    hintText: "Mobile",
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CommonTextFormFieldWidget(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your city";
                      }
                      return null;
                    },
                    controller: _cityNameETController,
                    hintText: "City",
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  CommonTextFormFieldWidget(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter your shipping";
                      }
                      return null;
                    },
                    controller: _shippingNameETController,
                    hintText: "Shipping",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CommonElevatedButtonWidget(
                    title: "Complete",
                    onTap: () async {
                      if (_fromKey.currentState!.validate()) {}
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
