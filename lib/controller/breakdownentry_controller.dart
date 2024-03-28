import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../constant/app_constants.dart';
import '../constant/variable_constant.dart';
import '../model/response/api_checker.dart';
import '../model/response/api_response.dart';
import '../repository/common_repo.dart';
import '../repository/login_repo.dart';
import '../repository/shared_repo.dart';
import '../repository/signalrrepo.dart';
import '../screen/entry_screen.dart';

class BreakDownEntryController extends GetxController {
  TextEditingController mcController = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  TextEditingController qcQtyController = TextEditingController();
  List<String> dropdownItems = [
    '',
    'Power Out',
    'Partial No Load',
  ];
  String dropdownValue = '';

  List<String> dropdownstatusItems = [
    '',
    'OK',
  ];
  // Default value for the dropdown
  String dropdownstatusValue = '';

  List<String> dropdownItems1 = [
    '',
    '0 - 30',
    '0 - 60',
  ];
  String dropdownValue1 = '';

  bool checkBoxValue = false;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

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
    qcQtyController.dispose();
  }

  void setDropdownVisibility(bool isVisible) {
    saveButtonVisible.value = isVisible;
    update();
  }

  Future<void> login() async {
    try {
      formKey.currentState!.save();
      if (!formKey.currentState!.validate()) {
        return;
      }
      isLoading = true;
      update();
    } catch (e) {
      rapidSoftPrint(e);
      Map<String, dynamic> exceptionModelMap = {};
      exceptionModelMap['methodName'] = 'login';
      exceptionModelMap['parameter'] = ' ';
      exceptionModelMap['exMessage'] = '$e';
      //CommonRepo().saveUIException(exceptionModelMap);
    }
    isLoading = false;
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
