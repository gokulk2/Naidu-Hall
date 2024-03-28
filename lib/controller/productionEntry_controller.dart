import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../constant/app_constants.dart';
import '../repository/common_repo.dart';

class ProductionEntryController extends GetxController {
  TextEditingController mcController = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  TextEditingController prodBarcodeController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  bool checkBoxValue = false;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  onBuilderInit() async {}

  @override
  void onClose() {
    super.onClose();
    mcController.dispose();
    operatorController.dispose();
    prodBarcodeController.dispose();
    qtyController.dispose();
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
}
