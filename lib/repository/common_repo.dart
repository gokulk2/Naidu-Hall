// import 'package:dio/dio.dart';
//
// import '../constant/api_error_handler.dart';
//
// import '../constant/url_constants.dart';
// import '../model/response/api_response.dart';
// import '../model/response/grid_model.dart';
//
// class CommonRepo {
//   Future<ApiResponse> getClientConfiguration() async {
//     try {
//       var url = URLConstants.clientConfiguration();
//       var response = await Dio(URLConstants.baseOptions()).get(url);
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//     }
//   }
//
//   Future<ApiResponse> saveClientConfiguration(
//       List<Map<String, dynamic>> modelMapList) async {
//     try {
//       var url = URLConstants.clientConfiguration();
//       var response =
//       await Dio(URLConstants.baseOptions()).post(url, data: modelMapList);
//       return ApiResponse.withSuccess(response);
//     } catch (e) {
//       return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//     }
//   }
//
//   // Future<ApiResponse> getDomainValues() async {
//   //   try {
//   //     var url = URLConstants.domainValue();
//   //     var response = await Dio(URLConstants.baseOptions()).get(url);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//   //
//   // Future<ApiResponse> getFieldConfiguration() async {
//   //   try {
//   //     var url = URLConstants.fieldConfiguration();
//   //     var response = await Dio(URLConstants.baseOptions()).get(url);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//
//   // Future<ApiResponse> saveUIException(Map<String, dynamic> modelMap) async {
//   //   try {
//   //     var url = URLConstants.exceptionLog();
//   //     var response =
//   //     await Dio(URLConstants.baseOptions()).post(url, data: modelMap);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//
//   // Future<ApiResponse> getGridData() async {
//   //   try {
//   //     var url = URLConstants.gridPersonalizationURI();
//   //     var response = await Dio(URLConstants.baseOptions()).get(url);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
// }
// //   Future<ApiResponse> saveGridData(List<GridPersonalizationModel> list) async {
// //     try {
// //       List dataList = [];
// //       for (var element in list) {
// //         dataList.add(element.toJson());
// //       }
// //       var url = URLConstants.saveGridPersonalizationURI();
// //       var response =
// //       await Dio(URLConstants.baseOptions()).post(url, data: dataList);
// //       return ApiResponse.withSuccess(response);
// //     } catch (e) {
// //       return ApiResponse.withError(ApiErrorHandler.getMessage(e));
// //     }
// //   }
// // }
//   // Future<ApiResponse> getDepartmentForDropdown() async {
//   //   try {
//   //     var url = URLConstants.getDepartmentDropdownURI();
//   //     var response = await Dio(URLConstants.baseOptions()).get(url);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//
//   // Future<ApiResponse> getNatureForDropdown() async {
//   //   try {
//   //     var url = URLConstants.getNatureDropdownURI();
//   //     var response = await Dio(URLConstants.baseOptions()).get(url);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//
//   // Future<ApiResponse> getDomainForDropdown() async {
//   //   try {
//   //     var url = URLConstants.getDomainDropdownURI();
//   //     var response = await Dio(URLConstants.baseOptions()).get(url);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//
//   // Future<ApiResponse> getAddressSearchList(value) async {
//   //   try {
//   //     var getAddressValue = value;
//   //     final getFormatAddress = Uri.encodeComponent(getAddressValue);
//   //     var url =
//   //         'https://geocode.arcgis.com/arcgis/rest/services/World/GeocodeServer/suggest?text=$getFormatAddress&countryCode=US&category=&outFields=*&forStorage=false&f=json';
//   //
//   //     var response = await Dio().get(url);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//
//   // Future<ApiResponse> getAddressVerified(value) async {
//   //   try {
//   //     var getAddressValue = value;
//   //     final getFormatAddress = Uri.encodeComponent(getAddressValue);
//   //     var url =
//   //         'https://geocode.arcgis.com/arcgis/rest/services/World/GeocodeServer/findAddressCandidates?f=json&outFields=Addr_type&SingleLine=$getFormatAddress';
//   //     var response = await Dio().get(
//   //       url,
//   //     );
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//
//   // Future<ApiResponse> getRoleForDropdown() async {
//   //   try {
//   //     var url = URLConstants.getRoleDropdownURI();
//   //     var response = await Dio(URLConstants.baseOptions()).get(url);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
//
//   // Future<ApiResponse> getAudioForDropdown() async {
//   //   try {
//   //     var url = URLConstants.getAudioDropdownURI();
//   //     var response = await Dio(URLConstants.baseOptions()).get(url);
//   //     return ApiResponse.withSuccess(response);
//   //   } catch (e) {
//   //     return ApiResponse.withError(ApiErrorHandler.getMessage(e));
//   //   }
//   // }
// //}
