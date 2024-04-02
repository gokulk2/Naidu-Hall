
import 'package:get/get.dart';
import '../constant/app_constants.dart';
import '../constant/extensions.dart';
import '../model/response/api_response.dart';
import '../model/response/field_confguration.dart';
import '../model/response/grid_model.dart';
import '../repository/common_repo.dart';

class MasterController extends GetxController {
  int selectedIndex = 0;
  List<Map<String, dynamic>> domainValueLists = [];
  List<Map<String, dynamic>> clientConfigurationList = [];
  List<FieldConfigurationModel> fieldConfigurationModelList = [];
  List<Map<String, dynamic>> departmentModelList = [];
  List<Map<String, dynamic>> natureModelList = [];
  List<Map<String, dynamic>> domainModelList = [];
  List<Map<String, dynamic>> roleModelList = [];

  //List<GridPersonalizationModel> gridPersonalizationModel = [];
  List<Map<String, dynamic>> audioModelList = [];

  @override
  void onInit() async {
    super.onInit();
  }



  // Future<void> getClientConfiguration() async {
  //   try {
  //     ApiResponse apiResponse = await CommonRepo().getClientConfiguration();
  //     if (checkAPIResponse(apiResponse)) {
  //       clientConfigurationList.clear();
  //       for (var value in apiResponse.response!.data) {
  //         clientConfigurationList.add(value);
  //       }
  //     }
  //   } catch (e) {
  //     rapidSoftPrint(e);
  //     Map<String, dynamic> exceptionModelMap = {};
  //     exceptionModelMap['methodName'] = 'getClientConfiguration';
  //     exceptionModelMap['parameter'] = '$clientConfigurationList';
  //     exceptionModelMap['exMessage'] = '$e';
  //     CommonRepo().saveUIException(exceptionModelMap);
  //   }
  // }

  // Future<void> getFieldConfiguration() async {
  //   try {
  //     ApiResponse apiResponse = await CommonRepo().getFieldConfiguration();
  //     if (checkAPIResponse(apiResponse)) {
  //       fieldConfigurationModelList.clear();
  //       for (var value in apiResponse.response!.data) {
  //         FieldConfigurationModel fieldConfigurationModel =
  //         FieldConfigurationModel.fromJson(value);
  //         fieldConfigurationModelList.add(fieldConfigurationModel);
  //       }
  //     }
  //   } catch (e) {
  //     rapidSoftPrint(e);
  //     Map<String, dynamic> exceptionModelMap = {};
  //     exceptionModelMap['methodName'] = 'getFieldConfiguration';
  //     exceptionModelMap['parameter'] = '$fieldConfigurationModelList';
  //     exceptionModelMap['exMessage'] = '$e';
  //    // CommonRepo().saveUIException(exceptionModelMap);
  //   }
  // }

  getConfigurationByName(String name) {
    String value = '';
    if (clientConfigurationList.any((element) =>
    element['name'].toString().toUpperCase() == name.toUpperCase())) {
      value = clientConfigurationList
          .where((element) =>
      element['name'].toString().toUpperCase() == name.toUpperCase())
          .first['value'];
    }
    return value;
  }

  List<FieldConfigurationModel> getFieldConfigurationByPageID(String pageID) {
    List<FieldConfigurationModel> fieldList = [];
    try {
      fieldList = fieldConfigurationModelList
          .where((element) =>
      toNullableString(element.pageConfigurationID) == pageID)
          .toList();
    } catch (e) {
      rapidSoftPrint(e);
      Map<String, dynamic> exceptionModelMap = {};
      exceptionModelMap['methodName'] = 'getFieldConfigurationByPageID';
      exceptionModelMap['parameter'] = pageID;
      exceptionModelMap['exMessage'] = '$e';
     // CommonRepo().saveUIException(exceptionModelMap);
    }
    return fieldList;
  }
}
// Future<void> getAllGridPersonalization() async {
//   try {
//     update();
//     ApiResponse apiResponse = await CommonRepo().getGridData();
//     if (apiResponse.response != null &&
//         apiResponse.response!.statusCode == 200) {
//       gridPersonalizationModel.clear();
//       apiResponse.response!.data.forEach((element) {
//         GridPersonalizationModel gridModel =
//         GridPersonalizationModel.fromJson(element);
//         gridPersonalizationModel.add(gridModel);
//       });
//     }
//   } catch (e) {
//     rapidSoftPrint(e);
//     Map<String, dynamic> exceptionModelMap = {};
//     exceptionModelMap['methodName'] = 'getAllGridPersonalization';
//     exceptionModelMap['parameter'] = '$gridPersonalizationModel';
//     exceptionModelMap['exMessage'] = '$e';
//     CommonRepo().saveUIException(exceptionModelMap);
//   }
//   update();
// }

//   List<GridPersonalizationModel> gridPersonalizationByGridID(String gridID) {
//     List<GridPersonalizationModel> list = <GridPersonalizationModel>[];
//     try {
//       list = gridPersonalizationModel
//           .where((element) => element.gridId.toString() == gridID)
//           .toList();
//       for (var element in list) {
//         element.width = element.defaultWidth;
//         element.isVisible = element.defaultVisibility;
//         element.isExpanded = element.defaultExpanded;
//         element.sortOrder = element.defaultSortOrder;
//       }
//
//       return list;
//     } catch (e) {
//       return list;
//     }
//   }
// }
//   Future<void> getDepartmentForDropdown() async {
//     try {
//       ApiResponse apiResponse = await CommonRepo().getDepartmentForDropdown();
//       if (checkAPIResponse(apiResponse)) {
//         departmentModelList.clear();
//         for (var value in apiResponse.response!.data) {
//           departmentModelList.add(value);
//         }
//       }
//     } catch (e) {
//       rapidSoftPrint(e);
//       Map<String, dynamic> exceptionModelMap = {};
//       exceptionModelMap['methodName'] = 'getDepartmentForDropdown';
//       exceptionModelMap['parameter'] = '$departmentModelList';
//       exceptionModelMap['exMessage'] = '$e';
//       CommonRepo().saveUIException(exceptionModelMap);
//     }
//   }
//
//   Future<void> getNatureForDropdown() async {
//     try {
//       ApiResponse apiResponse = await CommonRepo().getNatureForDropdown();
//       if (checkAPIResponse(apiResponse)) {
//         natureModelList.clear();
//         for (var value in apiResponse.response!.data) {
//           natureModelList.add(value);
//         }
//       }
//     } catch (e) {
//       rapidSoftPrint(e);
//       Map<String, dynamic> exceptionModelMap = {};
//       exceptionModelMap['methodName'] = 'getNatureForDropdown';
//       exceptionModelMap['parameter'] = '$natureModelList';
//       exceptionModelMap['exMessage'] = '$e';
//       CommonRepo().saveUIException(exceptionModelMap);
//     }
//   }
//
//   Future<void> getDomainForDropdown() async {
//     try {
//       ApiResponse apiResponse = await CommonRepo().getDomainForDropdown();
//       if (checkAPIResponse(apiResponse)) {
//         domainModelList.clear();
//         for (var value in apiResponse.response!.data) {
//           domainModelList.add(value);
//         }
//       }
//     } catch (e) {
//       rapidSoftPrint(e);
//       Map<String, dynamic> exceptionModelMap = {};
//       exceptionModelMap['methodName'] = 'getDomainForDropdown';
//       exceptionModelMap['parameter'] = '$domainModelList';
//       exceptionModelMap['exMessage'] = '$e';
//       CommonRepo().saveUIException(exceptionModelMap);
//     }
//   }
//
//   Future<void> getRoleForDropdown() async {
//     try {
//       ApiResponse apiResponse = await CommonRepo().getRoleForDropdown();
//       if (checkAPIResponse(apiResponse)) {
//         roleModelList.clear();
//         for (var value in apiResponse.response!.data) {
//           roleModelList.add(value);
//         }
//       }
//     }
//     catch (e) {
//       rapidSoftPrint(e);
//       Map<String, dynamic> exceptionModelMap = {};
//       exceptionModelMap['methodName'] = 'getRoleForDropdown';
//       exceptionModelMap['parameter'] = '$roleModelList';
//       exceptionModelMap['exMessage'] = '$e';
//       CommonRepo().saveUIException(exceptionModelMap);
//     }
//   }
//   Future<void> getAudioForDropdown() async {
//     try {
//       ApiResponse apiResponse = await CommonRepo().getAudioForDropdown();
//       if (checkAPIResponse(apiResponse)) {
//         audioModelList.clear();
//         for (var value in apiResponse.response!.data) {
//           audioModelList.add(value);
//         }
//       }
//     }
//     catch (e) {
//       rapidSoftPrint(e);
//       Map<String, dynamic> exceptionModelMap = {};
//       exceptionModelMap['methodName'] = 'getAudioForDropdown';
//       exceptionModelMap['parameter'] = '$audioModelList';
//       exceptionModelMap['exMessage'] = '$e';
//       CommonRepo().saveUIException(exceptionModelMap);
//     }
//   }
// }
