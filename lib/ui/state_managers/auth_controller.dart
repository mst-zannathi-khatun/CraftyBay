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
    // Convert profile to JSON string and save it
    await preference.setString('user_profile', jsonEncode(profile.toJson()));
  }

  Future<void> getToken() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    _token = preference.getString('crafty_token');
  }

  Future<void> getProfileData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    String? jsonString = preference.getString('user_profile');

    // Log the JSON string for debugging
    print("Retrieved JSON string: $jsonString");

    if (jsonString != null && jsonString.isNotEmpty) {
      try {
        // Parse the JSON string into a Map
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);

        // Convert the JSON Map into a ProfileData object
        _profileData = ProfileData.fromJson(jsonMap);
      } catch (e) {
        print("Error parsing JSON: $e");
        // Handle or log the error appropriately
      }
    } else {
      // Handle the case where there is no profile data
      print("No profile data found.");
      _profileData = null;
    }
  }

  Future<void> clearUserData() async {
    SharedPreferences preference = await SharedPreferences.getInstance();
    await preference.clear();
    _token = null;
    _profileData = null;
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
