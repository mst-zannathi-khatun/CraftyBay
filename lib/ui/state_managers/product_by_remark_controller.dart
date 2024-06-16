import 'package:craftybay/data/models/productbyremark_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  bool _getProductByRemarkModelInProgress = false;
  PopularProductModel _popularProduct = PopularProductModel();

  bool get getProductByRemarkModelInProgress =>
      _getProductByRemarkModelInProgress;

  PopularProductModel get popularProduct => _popularProduct;

  Future<bool> getPopularProductsByRemark() async {
    _getProductByRemarkModelInProgress = true;
    update();
    final response =
        await NetworkCaller.getRequest(url: '/ListProductByRemark/popular');
    _getProductByRemarkModelInProgress = false;
    if (response.isSuccess) {
      _popularProduct = PopularProductModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
