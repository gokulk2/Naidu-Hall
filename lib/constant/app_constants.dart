import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_navigation/src/routes/observers/route_observer.dart';
import 'package:intl/intl.dart';

import '../custom_widget/alert_message.dart';
import '../custom_widget/logout_handler.dart';
import '../model/response/api_checker.dart';
import '../model/response/api_response.dart';
import 'color_constants.dart';
import 'extensions.dart';

String dateTimeFormat = "MM/dd/yyyy HH:mm";
String dateFormat = "MM/dd/yyyy";
String timeMask = '00:00';

bool checkAPIResponse(ApiResponse apiResponse) {
  if (apiResponse.response != null &&
      (apiResponse.response!.statusCode == 200 ||
          apiResponse.response!.statusCode == 201)) {
    return true;
  } else {
    return false;
  }
}

rapidSoftPrint(e) {
  if (kDebugMode) {
    print(e);
  }
}

width() {
  double width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
  return width;
}

height() {
  double width =
      MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
  return width;
}

String convertDateTimeString(var dateTimeString) {
  String selectedDate = "";
  if (isNotNullOrEmpty(dateTimeString)) {
    DateFormat newDateFormat = DateFormat(dateTimeFormat);
    DateTime dateTime =
    DateFormat("yyyy-MM-dd'T'HH:mm:ss").parse(dateTimeString);
    selectedDate = newDateFormat.format(dateTime);
  }
  return selectedDate;
}

sizedBox20() {
  return const SizedBox(
    height: 20,
  );
}

sizedBox8() {
  return const SizedBox(
    height: 8,
  );
}

sizedBox16() {
  return const SizedBox(
    height: 16,
  );
}
class PMDButton extends StatelessWidget {
  final String closeButtonName;
  final Function(BuildContext) closeEvent;

  const PMDButton({
    Key? key,
    required this.closeButtonName,
    required this.closeEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () => closeEvent(context),
        child: Card(
          elevation: 5,
          color: pmdButtonColor,
          child: SizedBox(
            width: 150,
            height: 40,
            child: Center(
              child: ButtonText(buttonText: closeButtonName),
            ),
          ),
        ),
      ),
    );
  }
}

class PMDButton1 extends StatelessWidget {
  final bool saveEnabled;
  final Function(BuildContext) saveEvent;
  final Function(BuildContext) cancelEvent;
  final Function(BuildContext) operatorEvent;
  final String saveButtonName;
  final String cancelButtonName;
  final String operatorButtonName;
  final bool saveButtonVisible;

  const PMDButton1({
    Key? key,
    required this.saveEnabled,
    required this.saveEvent,
    required this.cancelEvent,
    required this.operatorEvent,
    this.cancelButtonName = 'Cancel',
    this.operatorButtonName = 'Operation',
    this.saveButtonName = 'Save',
    this.saveButtonVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            cancelEvent(context);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.blue, // Change color to your desired color
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: Colors.blueAccent), // Border color
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          child: Text(
            cancelButtonName,
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 20), // Use const SizedBox for better performance
        ElevatedButton(
          onPressed: () {
            operatorEvent(context);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.orange, // Change color to your desired color
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: Colors.blueAccent), // Border color
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
          ),
          child: Text(
            operatorButtonName,
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 20), // Use const SizedBox for better performance
        Visibility(
          visible: saveButtonVisible,
          child: ElevatedButton(
            onPressed: saveEnabled ? () => saveEvent(context) : null,
            style: ElevatedButton.styleFrom(
              primary: saveEnabled ? Colors.green : Colors.blueGrey,
              // Change color based on saveEnabled
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.blueAccent), // Border color
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: saveEnabled
                ? Text(
              saveButtonName,
              style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
            )
                : const CircularProgressIndicator(
              backgroundColor: Colors.white, // Change loader color
            ),
          ),
        ),
      ],
    );
  }
}

class PMDButton2 extends StatelessWidget {
  final String closeButtonName;
  final Function(BuildContext) closeEvent;

  const PMDButton2({
    Key? key,
    required this.closeButtonName,
    required this.closeEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => closeEvent(context),
          borderRadius: BorderRadius.circular(8), // Adjust as needed
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), // Adjust as needed
              color: pmdColor, // Change color as needed
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: SizedBox(
              width: 250,
              height: 40,
              child: Center(
                child: Text(
                  closeButtonName,
                  style: const TextStyle(
                    color: Colors.white, // Change text color as needed
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PMDButton3 extends StatelessWidget {
  final bool saveEnabled;
  final Function(BuildContext) saveEvent;
  final Function(BuildContext) cancelEvent;
  final String saveButtonName;
  final String cancelButtonName;
  final bool saveButtonVisible;
  const PMDButton3({
    Key? key,
    required this.saveEnabled,
    required this.saveEvent,
    required this.cancelEvent,
    this.cancelButtonName = 'Cancel',
    this.saveButtonName = 'OK',
    this.saveButtonVisible = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            cancelEvent(context);
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.green, // Change color to your desired color
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: const BorderSide(color: Colors.blueAccent), // Border color
            ),
          ),
          child: Text(
            cancelButtonName,
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 20), // Use const SizedBox for better performance
        Visibility(
          visible: saveButtonVisible,
          child: ElevatedButton(
            onPressed: saveEnabled ? () => saveEvent(context) : null,
            style: ElevatedButton.styleFrom(
              primary: saveEnabled ? Color(0xfff7892b): Colors.blueGrey,
              // Change color based on saveEnabled
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.blueAccent), // Border color
              ),
            ),
            child: saveEnabled
                ? Text(
              saveButtonName,
              style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
            )
                : const CircularProgressIndicator(
              backgroundColor: Colors.white, // Change loader color
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonText extends StatelessWidget {
  final String buttonText;

  const ButtonText({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonText,
      style: TextStyle(
        color: blackColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}

class PMDText extends StatelessWidget {
  const PMDText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class ScreenSize extends GetObserver {
  /// 420
  // bool isMobile() => width() > 299 && width() < 599;
  bool isMobile() => width() < 420;

  /// 420 to 1024
  // bool isTablet() => width() >= 600 && width() < 799;
  // bool isTablet() => width() >= 600 && width() < 1099;
  bool isTablet() => width() >= 420 && width() < 1024;

  bool isMiniDesktop() => width() >= 800 && width() < 1099;

  // bool isDesktop() => width() >= 1200 && width() <= 1400;
  /// 1024 above
  bool isDesktop() => width() >= 1024;

  bool isMaxDesktop() => width() >= 1600;

  bool isConstraintDesktop(double width) => width >= 1024;

  bool isConstraintMobile(double width) => width < 420;

  bool isConstraintTablet(double width) => width >= 420 && width < 1024;

  int checkForDoubleRow(double width) {
    int lg = 6;
    if (width < 420) {
      lg = 12;
    } else {
      lg = 6;
    }
    return lg;
  }

  nonVisibility() {
    return Container();
  }

  titleFontSize() {
    if (isMobile()) {
      return 12.0;
    } else if (isTablet()) {
      return 14.0;
    } else {
      return 14.0;
    }
  }

  subTitleFontSize() {
    if (isMobile()) {
      return 10.0;
    } else if (isTablet()) {
      return 12.0;
    } else {
      return 12.0;
    }
  }

  width() {
    double width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.width;
    return width;
  }

  height() {
    double width =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
    return width;
  }

  getScreen() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.saveEvent,
    required this.saveEnabled,
    required this.buttonName,
    this.buttonColor = const Color.fromRGBO(53, 49, 97, 1),
  });

  final Function saveEvent;
  final bool saveEnabled;
  final String buttonName;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !saveEnabled
          ? null
          : () {
        saveEvent(context);
      },
      child: Card(
        elevation: 5,
        color: buttonColor,
        child: SizedBox(
          width: 80,
          height: 30,
          child: Center(
            child: !saveEnabled
                ? ApiChecker().buttonLoader()
                : ButtonText(
              buttonText: buttonName,
            ),
          ),
        ),
      ),
    );
  }
}

class PMDTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const PMDTextField({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class PMDQRScanButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PMDQRScanButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
        minimumSize: MaterialStateProperty.all<Size>(const Size(400, 40)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.qr_code),
          SizedBox(width: 8),
          PMDText(text: 'Scan Machine Barcode'),
        ],
      ),
    );
  }
}

AppBar PMDAppBar(BuildContext context, String titleText) {
  return AppBar(
    toolbarHeight: 50,
    backgroundColor: Colors.red,
    actions: [
      Container(
        child: Row(
          children: [

            Text(titleText ,style:  TextStyle( fontSize: 20,), ),
            SizedBox(width:100),
            LogoutHandler.buildLogoutButton(context, () {
              Navigator.pushNamed(context, '/login');
            }),
          ],
        ),
      ),
    ],
  );
}



