import 'package:craftybay/data/models/productbyremark_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  bool _getProductControllerInProgress = false;
  ProductByRemarkModel _productCategoryModel = ProductByRemarkModel();

  bool get getProductControllerInProgress => _getProductControllerInProgress;
  ProductByRemarkModel get productByCategoryModel => _productCategoryModel;

  Future<bool> getProductCategory(int categoryId) async {
    _getProductControllerInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(
        url: '/ListProductByCategory/$categoryId');
    _getProductControllerInProgress = false;
    if (response.isSuccess) {
      _productCategoryModel = ProductByRemarkModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
