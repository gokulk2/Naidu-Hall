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

class QualityEntryController extends GetxController {
  Map<String, dynamic> saveQualityModelMap = {};
  TextEditingController mcController = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  TextEditingController qcQtyController = TextEditingController();
  List<String> dropdownItems = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  String dropdownValue = 'Option 1';

  bool checkBoxValue = false;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  onBuilderInit() async {}

  @override
  void onClose() {
    super.onClose();
    mcController.dispose();
    operatorController.dispose();
    qcQtyController.dispose();
  }

  Future<void> saveQualityData(BuildContext context) async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return;
    }
    saveQualityModelMap['machineNo'] = mcController.text;
    saveQualityModelMap['operator'] = operatorController.text;
    saveQualityModelMap['qc_Quantity'] = qcQtyController.text;
    saveQualityModelMap['reason'] = dropdownValue;
    saveQualityModelMap['rejection'] = dropdownValue;
    saveQualityModelMap['reworkStation'] = dropdownValue;
    try {
      ApiResponse apiResponse =
          await AdminRepo().saveQuality(saveQualityModelMap);
      if (checkAPIResponse(apiResponse)) {
        ApiChecker().successMessageGetX(
            header: 'Quality Data', message: 'Saved Successfully');
      }
    } catch (e) {
      rapidSoftPrint(e);
      Map<String, dynamic> exceptionModelMap = {};
      exceptionModelMap['methodName'] = 'saveQualityData';
      exceptionModelMap['parameter'] = '$saveQualityModelMap';
      exceptionModelMap['exMessage'] = '$e';
    }
    update();
  }
}
