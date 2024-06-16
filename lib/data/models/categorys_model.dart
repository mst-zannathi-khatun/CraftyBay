import 'category.dart';

class CategoryModel {
  String? msg;
  List<Category>? category;

  CategoryModel({this.msg, this.category});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      category = <Category>[];
      json['data'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (category != null) {
      data['data'] = category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

