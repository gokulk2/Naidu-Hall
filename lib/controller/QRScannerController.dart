// import 'package:flutter/cupertino.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class QRScannerController extends GetxController {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   late QRViewController qrController;
//
//   void onQRViewCreated(QRViewController controller) {
//     this.qrController = controller;
//     qrController.scannedDataStream.listen((scanData) {
//       // Handle the scanned data here
//       print('Scanned Data: ${scanData.code}');
//       // You can now use the scanned data as per your requirement,
//       // such as displaying it in a dialog or navigating to another screen.
//     });
//   }
//
//   @override
//   void dispose() {
//     qrController.dispose();
//     super.dispose();
//   }
// }
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  // Define your state variables and functions here
  var count = 0.obs;

  void increment() {
    count++;
  }
}