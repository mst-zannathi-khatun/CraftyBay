import 'package:craftybay/data/models/productbyremark_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:get/get.dart';

class SpecialProductController extends GetxController {
  bool _specialProductInProgress = false;
  ProductByRemarkModel _specialProduct = ProductByRemarkModel();

  bool get specialProductInProgress => _specialProductInProgress;

  ProductByRemarkModel get specialProduct => _specialProduct;

  Future<bool> getSpecialProduct() async {
    _specialProductInProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: '/ListProductByRemark/special');
    _specialProductInProgress = false;
    if (response.isSuccess) {
      _specialProduct = ProductByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
