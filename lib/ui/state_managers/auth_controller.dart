import 'dart:convert';
import 'package:craftybay/ui/screens/email_address_verification_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/models/profile_model.dart';

class AuthController extends GetxController {
  static String? _token;
  static ProfileData? _profileData;

  static String? get token => _token;

  static ProfileData? get profile => _profileData;

  Future<bool> isLoggedIn() async {
    await getToken();
    await getProfileData();
    return _token != null;
  }

  Future<void> saveToken(String userToken) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _token = userToken;
    await preference.setString('crafty_token', userToken);
  }

  Future<void> saveProfileData(ProfileData profile) async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _profileData = profile;
    String jsonString = jsonEncode(profile.toJson()); // Serialize to JSON string
    await preference.setString('user_profile', jsonString);
  }


  Future<void> getToken() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _token = preference.getString('crafty_token');
  }

  Future<void> getProfileData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    String? jsonString = preference.getString('user_profile');
    print("Retrieved JSON string: $jsonString"); // Log retrieved JSON string
    if (jsonString != null && jsonString.isNotEmpty) {
      _profileData = ProfileData.fromJson(jsonDecode(jsonString));
    } else {
      _profileData = null;
    }
  }


  Future<void> clearUserData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    await preference.clear();
    _token = null;
  }

  Future<void> logOut() async {
    await clearUserData();
    Get.to(const EmailAddressVerificationScreen());
  }

  Future<bool> checkAuthValidation() async {
    final authState = await Get.find<AuthController>().isLoggedIn();
    if (authState == false) {
      Get.to(const EmailAddressVerificationScreen());
    }
    return authState;
  }
}
