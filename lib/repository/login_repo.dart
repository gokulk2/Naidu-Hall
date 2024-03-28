import 'package:dio/dio.dart';

import '../constant/api_error_handler.dart';
import '../constant/url_constants.dart';
import '../model/response/api_response.dart';

class LoginRepo {
  Future<ApiResponse> login(Map<String, dynamic> modelMap) async {
    try {
      var url = URLConstants.login();
      var response =
      await Dio(URLConstants.baseOptions()).post(url, data: modelMap);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}