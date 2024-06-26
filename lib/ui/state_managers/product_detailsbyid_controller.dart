import 'package:craftybay/data/models/product_details_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:get/get.dart';

class ProductDetailsByIDController extends GetxController {
  bool _productDetailsInProgress = false;
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  bool get productDetailsInProgress => _productDetailsInProgress;
  ProductDetailsModel get productDetailsModel => _productDetailsModel;

  Future<bool> getProductDetails(int productId) async {
    _productDetailsInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/ProductDetailsById/$productId');
    _productDetailsInProgress = false;
    if (response.isSuccess) {
      _productDetailsModel = ProductDetailsModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
