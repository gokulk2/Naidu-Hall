import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/color_constants.dart';
import 'api_response.dart';

class ApiChecker {
  void checkApiGetX(
      {required ApiResponse apiResponse, var header, Icon? icon}) {
    if (apiResponse.response == null ||
        apiResponse.response!.statusCode == 204) {
    } else if (apiResponse.error is! String &&
        apiResponse.error.errors[0].message == 'Unauthorized.') {
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        errorMessage = apiResponse.error.toString();
      } else {
        errorMessage = apiResponse.error.errors[0].message;
      }
      Get.snackbar('', errorMessage,
          backgroundColor: Colors.red,
          dismissDirection: DismissDirection.down,
          snackPosition: SnackPosition.BOTTOM,
          icon: icon,
          borderRadius: 10,
          maxWidth: 300,
          margin: const EdgeInsets.all(10),
          colorText: Colors.white,
          duration: const Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack);
    }
  }

  void successMessageGetX({var header, var message, Icon? icon}) {
    Get.snackbar(
      "",
      "",
      maxWidth: 300,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      borderRadius: 10,
      titleText: Text(
        '${header ?? ''}',
      ),
      messageText: Text(
        '${message ?? ''}',
        // '${Get.find<PopupConfigurationController>().popupConfigListModelMap[index]['message'] ?? ''}',
        //style: GridDataListStyle,
      ),
    );
  }

  void failureMessageGetX({var header, var message, Icon? icon}) {
    Get.snackbar(
      '${header ?? ''}',
      '${message ?? ''}',
      maxWidth: 300,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.4),
      colorText: Colors.white,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      borderRadius: 10,
    );
  }

  void warningMessageGetX({var header, var message, Icon? icon}) {
    Get.snackbar(
      '${header ?? ''}',
      '${message ?? ''}',
      maxWidth: 300,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red.withOpacity(0.7),
      colorText: Colors.white,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
      borderRadius: 10,
    );
  }

  titleLoader() {
    return Container(
      height: 25,
      width: 25,
      padding: const EdgeInsets.all(5),
      child: CircularProgressIndicator(
        color: mainColor,
      ),
    );
  }

  buttonLoader() {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        color: whiteColor,
      ),
    );
  }

  loader() {
    return SizedBox(
      width: 50,
      height: 200,
      child: Center(
        child: SizedBox(
          width: 50,
          height: 50,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Image(
                image: AssetImage("asset/ai_logo.png"),
                height: 25,
                width: 25,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 50.0,
                width: 50.0,
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget sizedBox() {
    return const SizedBox(
      width: 10,
      height: 10,
    );
  }

  Widget divider() {
    return Divider(
      color: pmdColor,
      thickness: 2,
    );
  }

  void alert(String message) {
    Get.defaultDialog(
      title: '',
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Login Error'),
            divider(),
            Text(message),
            sizedBox(),
            Center(
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 50,
                  height: 30,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: pmdColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      'Ok',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void functionAlert(String title, String message, Function callBack) {
    Get.defaultDialog(
      title: '',
      backgroundColor: Colors.transparent,
      content: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Divider(
              color: Colors.grey[400],
              thickness: 1,
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                      Get.toNamed('/');
                      callBack(true); // Yes option selected
                    },
                    child: const Text(
                      'Yes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20), // Adjust the width based on your preference
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                      callBack(false); // No option selected
                    },
                    child: const Text(
                      'No',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // void functionAlert(String title, String message, Function callBack) {
  //   Get.defaultDialog(
  //     title: '',
  //     backgroundColor: Colors.transparent,
  //     content: Container(
  //       padding: const EdgeInsets.all(10),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(5),
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Text(title),
  //           divider(),
  //           Text(message),
  //           sizedBox(),
  //           Center(
  //             child: PMDButton3(
  //                 saveButtonName: 'OK',
  //                 saveButtonVisible: true,
  //                 saveEnabled: true,
  //                 saveEvent: (ctx) {
  //                   Get.back();
  //                   callBack();
  //                 },
  //                 cancelEvent: (ctx) {
  //                   Get.back();
  //                 },),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  confirmDialog(BuildContext context,
      {String yesButtonName = "Yes",
        String noButtonName = "No",
        String dialogTitle = "Title",
        String dialogContent = "This is a sample dialog",
        VoidCallback? yesPressed}) {
    Widget okButton = TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(mainColor),
      ),
      onPressed: yesPressed!,
      child: Text(
        yesButtonName,
        style: const TextStyle(color: Colors.white),
      ),
    );
    Widget cancelButton = TextButton(
        child: Text(noButtonName),
        onPressed: () {
          Navigator.of(context).pop();
        });

    AlertDialog alert = AlertDialog(
      title: Text(dialogTitle),
      content: Text(dialogContent),
      actions: [
        okButton,
        cancelButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
