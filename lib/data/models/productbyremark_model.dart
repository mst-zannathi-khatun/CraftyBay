import 'package:craftybay/data/models/product.dart';

class PopularProductModel {
  String? msg;
  List<Product>? product;

  PopularProductModel({this.msg, this.product});

  PopularProductModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      product = <Product>[];
      json['data'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (product != null) {
      data['data'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
