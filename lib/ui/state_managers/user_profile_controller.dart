import 'package:craftybay/data/models/profile_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/ui/screens/completed_profile_screen.dart';
import 'package:craftybay/ui/state_managers/auth_controller.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  bool _getProfileDataInProgress = false;

  bool get getProfileDataInProgress => _getProfileDataInProgress;

  Future<bool> getProfileData() async {
    _getProfileDataInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ReadProfile');
    _getProfileDataInProgress = false;
    if (response.isSuccess) {
      final ProfileModel profileModel =
          ProfileModel.fromJson(response.returnData);
      if (profileModel.data != null) {
        Get.find<AuthController>().saveProfileData(profileModel.data!.first);
      } else {
        Get.to(const CompletedProfileScreen());
      }
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
