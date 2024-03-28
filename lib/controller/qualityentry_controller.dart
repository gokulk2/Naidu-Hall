
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

class QualityEntryController extends GetxController {
  TextEditingController mcController = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  TextEditingController qcQtyController = TextEditingController();
  List<String> dropdownItems = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  // Default value for the dropdown
  String dropdownValue = 'Option 1'; // Ensure this value is unique among dropdown items

  bool checkBoxValue = false;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  onBuilderInit() async {
    // checkBoxValue = SharedRepo().getRememberCheck();
    // if (checkBoxValue) {
    //   userNameController.text = SharedRepo().getUserName();
    //   passwordController.text = SharedRepo().getUserPassword();
    // }
    // update();
  }

  @override
  void onClose() {
    super.onClose();
    mcController.dispose();
    operatorController.dispose();
    qcQtyController.dispose();
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
     // CommonRepo().saveUIException(exceptionModelMap);
    }
    isLoading = false;
    update();
  }
}
