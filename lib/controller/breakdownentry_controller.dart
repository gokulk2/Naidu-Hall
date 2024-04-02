import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../constant/app_constants.dart';
import '../constant/variable_constant.dart';
import '../model/response/api_checker.dart';
import '../model/response/api_response.dart';
import '../repository/admin_repo.dart';
import '../repository/common_repo.dart';
import '../repository/login_repo.dart';
import '../repository/shared_repo.dart';
import '../repository/signalrrepo.dart';
import '../screen/entry_screen.dart';

class BreakDownEntryController extends GetxController {

  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> saveBreakDownModelMap = {};
  TextEditingController mcController = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  List<String> dropdownItems = [
    '',
    'Power Out',
    'Partial No Load',
  ];
  String dropdownValue = '';

  List<String> dropdownStatusItems = [
    '',
    'OK',
  ];
  // Default value for the dropdown
  String dropdownStatusValue = '';

  List<String> dropdownItems1 = [
    '',
    '0 - 30',
    '0 - 60',
  ];
  String dropdownValue1 = '';
  bool isLoading = false;


  RxBool saveButtonVisible = false.obs;

  @override
  void onInit() {
    super.onInit();
    onBuilderInit();
  }

  onBuilderInit() async {}

  @override
  void onClose() {
    super.onClose();
    mcController.dispose();
    operatorController.dispose();
  }

  void setDropdownVisibility(bool isVisible) {
    saveButtonVisible.value = isVisible;
    update();
  }

  Future<void> saveBreakDownData(BuildContext context) async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return;
    }
    saveBreakDownModelMap['machineNo'] = mcController.text;
    saveBreakDownModelMap['operator'] = operatorController.text;
    saveBreakDownModelMap['reason'] = dropdownValue;
    saveBreakDownModelMap['status'] = dropdownStatusValue;

    try {
      ApiResponse apiResponse =
      await AdminRepo().saveBreakDown(saveBreakDownModelMap);
      if (checkAPIResponse(apiResponse)) {
        ApiChecker().successMessageGetX(
            header: 'BreakDown Data', message: 'Saved Successfully');
      }
    } catch (e) {
      rapidSoftPrint(e);
      Map<String, dynamic> exceptionModelMap = {};
      exceptionModelMap['methodName'] = 'saveBreakDownData';
      exceptionModelMap['parameter'] = '$saveBreakDownModelMap';
      exceptionModelMap['exMessage'] = '$e';
    }
    update();
  }

  void operatorEvent(BuildContext context) {
    if (dropdownValue == 'Power Out') {
      setDropdownVisibility(true);
    }
    else if (dropdownValue == 'Partial No Load') {
      setDropdownVisibility(true);
    }
    else {
      setDropdownVisibility(false);
    }
  }

  bool selectedDropDownValue() {
    return dropdownValue != null && dropdownValue.isNotEmpty;
  }
}
