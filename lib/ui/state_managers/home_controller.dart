import 'package:craftybay/data/models/home_sliders_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool _getSliderInProgress = false;
  HomeSlidersModel _homeSlidersModel = HomeSlidersModel();

  bool get getSliderInProgress => _getSliderInProgress;

  HomeSlidersModel get homeSlidersModel => _homeSlidersModel;

  Future<bool> getHomeSlider() async {
    _getSliderInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ListProductSlider');
    _getSliderInProgress = false;
    update();
    if (response.isSuccess) {
      _homeSlidersModel = HomeSlidersModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return true;
    }
  }
}
