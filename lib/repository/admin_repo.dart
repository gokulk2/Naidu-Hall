import 'package:dio/dio.dart';

import '../constant/api_error_handler.dart';
import '../constant/url_constants.dart';
import '../model/response/api_response.dart';

class AdminRepo {
  Future<ApiResponse> saveProduction(Map<String, dynamic> modelMap) async {
    try {
      var url = URLConstants.saveProductionURI();
      var response =
      await Dio(URLConstants.baseOptions()).post(url, data: modelMap);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> saveQuality(Map<String, dynamic> modelMap) async {
    try {
      var url = URLConstants.saveQualityURI();
      var response =
      await Dio(URLConstants.baseOptions()).post(url, data: modelMap);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> saveBreakDown(Map<String, dynamic> modelMap) async {
    try {
      var url = URLConstants.saveBreakDownURI();
      var response =
      await Dio(URLConstants.baseOptions()).post(url, data: modelMap);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}