import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../data/models/productbyremark_model.dart';
import '../../data/services/network_caller.dart';

class NewProductController extends GetxController {
  bool _newProductControllerInProgress = false;
  ProductByRemarkModel _newProduct = ProductByRemarkModel();

  bool get newProductControllerInProgress => _newProductControllerInProgress;

  ProductByRemarkModel get newProductModel => _newProduct;

  Future<bool> getNewProducts() async {
    _newProductControllerInProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: '/ListProductByRemark/new');
    _newProductControllerInProgress = false;
    update();
    if (response.isSuccess) {
      _newProduct = ProductByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
