import 'dart:convert';

import 'package:dio/dio.dart' as dio_import;
import 'package:dio_mock_interceptor/dio_mock_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:freight_delivery_app/api_service/api_end_points.dart';
import 'package:freight_delivery_app/api_service/networking_client.dart';
import 'package:freight_delivery_app/model/login_model.dart';
import 'package:freight_delivery_app/utilities/app_routes.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  @override
  void onInit() {
    if(kDebugMode) {
      loginEmailTxtCn.text = "zain@gmail.com";
      loginPwdTxtCn.text = "Ambitious123";
    }
    super.onInit();
  }
  var loginFormKey = GlobalKey<FormState>();
  TextEditingController loginEmailTxtCn = TextEditingController();
  TextEditingController loginPwdTxtCn = TextEditingController();

  Future<bool?> tappedContinue(String email,String password) async {
      dio_import.Dio dio = dio_import.Dio(dio_import.BaseOptions());
      dio.interceptors.add(MockInterceptor());
      dio_import.Response response = await dio
          .post(ApiEndpoints.userLogin); // the same path as common.json
      String json = response.data;
      if (json.isEmpty) {
        // throw Exception('response is empty');
        return null;
      }
      Map<String, dynamic> data = jsonDecode(json);
      try {
        var resp = Data.fromJson(data);
        if (resp.success == true) {
          if (resp.result?.userEmail == email &&
              resp.result?.password == password) {
            return true;
          } else {
            return false;
          }
        }
      } catch (e) {
        return false;
      }
  }
}
