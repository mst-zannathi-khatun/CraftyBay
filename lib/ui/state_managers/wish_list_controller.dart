import 'package:craftybay/data/services/network_caller.dart';
import 'package:craftybay/ui/state_managers/auth_controller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool _addNewInProgress = false;

  bool get addNewInProgress => _addNewInProgress;

  Future<bool> addToWishlist(int productId) async {
    _addNewInProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: '/CreateWishList/$productId');
    _addNewInProgress = false;
    if (response.isSuccess) {
      update();
      return true;
    } else {
      if (response.statusCode == 401) {
        Get.find<AuthController>().logOut();
      }
      update();
      return false;
    }
  }
}
