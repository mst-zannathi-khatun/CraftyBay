import 'dart:convert';
import 'dart:developer';
import 'package:craftybay/data/models/response_model.dart';
import 'package:craftybay/data/utils/urls.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:http/http.dart';

class NetworkCaller {
  NetworkCaller._();

  static Future<ResponseModel> getRequest({required String url}) async {
    try {
      final http.Response response = await get(Uri.parse(Urls.baseUrls + url));
      if (response.statusCode == 200) {
        return ResponseModel(
          statusCode: response.statusCode,
          isSuccess: true,
          returnData: jsonDecode(response.body),
        );
      } else {
        return ResponseModel(
          statusCode: response.statusCode,
          isSuccess: false,
          returnData: jsonDecode(response.body),
        );
      }
    } catch (e) {
      log(e.toString());
      return ResponseModel(
          statusCode: -1,
          isSuccess: false,
          returnData: e.toString());
    }
  }
}
