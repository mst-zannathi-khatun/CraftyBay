import 'package:craftybay/data/models/categorys_model.dart';
import 'package:craftybay/data/services/network_caller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CategoryController extends GetxController {
  bool _getCategoryInProgress = false;
  CategoryModel _categoryModel = CategoryModel();

  bool get getCategoryInProgress => _getCategoryInProgress;

  CategoryModel get categoryModel => _categoryModel;

  Future<bool> getCategory() async {
    _getCategoryInProgress = true;
    update();
    final response = await NetworkCaller.getRequest(url: '/CategoryList');
    _getCategoryInProgress = false;
    update();
    if (response.isSuccess) {
      _categoryModel = CategoryModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}
