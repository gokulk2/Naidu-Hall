import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../constant/app_constants.dart';
import '../model/response/api_checker.dart';
import '../model/response/api_response.dart';
import '../repository/login_repo.dart';
import '../repository/shared_repo.dart';
import '../repository/signalrrepo.dart';

class LoginController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool checkBoxValue = false;
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  onBuilderInit() async {
    checkBoxValue = await SharedRepo().getRememberCheck();
    if (checkBoxValue) {
      userNameController.text = SharedRepo().getUserName();
      passwordController.text = SharedRepo().getUserPassword();
    }
    update();
  }

  @override
  void onClose() {
    super.onClose();
    userNameController.dispose();
    passwordController.dispose();
  }

  Future<void> login() async {
    try {
      Get.toNamed('/entry');
      formKey.currentState!.save();
      if (!formKey.currentState!.validate()) {
        return;
      }
      isLoading = true;
      update();
      Map<String, dynamic> modelMap = <String, dynamic>{};
      modelMap['userName'] = userNameController.text;
      modelMap['password'] = passwordController.text;
      modelMap['rememberMe'] = checkBoxValue;
      ApiResponse apiResponse = await LoginRepo().login(modelMap);
      if (checkAPIResponse(apiResponse)) {
        Map<String, dynamic> responseModelMap = apiResponse.response!.data;
        await SharedRepo().saveUserDetails(responseModelMap);
        if (checkBoxValue) {
          SharedRepo().saveUser(modelMap);
        } else {
          SharedRepo().clearUserNameAndPassword();
        }
        SignalRRepo.initializeConnection();
        //routeToDashboard();
      } else if (apiResponse.response != null &&
          apiResponse.response!.statusCode == 203) {
        ApiChecker().alert(apiResponse.response!.data);
      } else {
        ApiChecker().checkApiGetX(apiResponse: apiResponse);
      }
    } catch (e) {
      rapidSoftPrint(e);
      Map<String, dynamic> exceptionModelMap = {};
      exceptionModelMap['methodName'] = 'login';
      exceptionModelMap['parameter'] = ' ';
      exceptionModelMap['exMessage'] = '$e';
      //  CommonRepo().saveUIException(exceptionModelMap);
    }
    isLoading = false;
    update();
  }
}
