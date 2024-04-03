

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../constant/app_constants.dart';
import '../model/response/api_checker.dart';
import '../model/response/api_response.dart';
import '../repository/admin_repo.dart';

class ProductionEntryController extends GetxController {
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> saveProductionModelMap = {};
  TextEditingController mcController = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  TextEditingController prodBarcodeController = TextEditingController();
  TextEditingController qtyController = TextEditingController();
  bool checkBoxValue = false;
  bool isLoading = false;
  String scannedQrcode = '';
  late CameraController cameraController;
  late Future<void> cameraInitFuture;

  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }
  onBuilderInit() async {}

  @override
  void onClose() {
    super.onClose();
    mcController.dispose();
    operatorController.dispose();
    prodBarcodeController.dispose();
    qtyController.dispose();
    cameraController.dispose();
  }
  // Future<void> initializeCamera() async {
  //   // Request camera permission
  //   final PermissionStatus cameraPermissionStatus = await Permission.camera.request();
  //   if (cameraPermissionStatus.isGranted) {
  //     // Get a list of available cameras
  //     final cameras = await availableCameras();
  //     final frontCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);
  //
  //     // Initialize the camera controller with the front camera
  //     cameraController = CameraController(frontCamera, ResolutionPreset.medium);
  //     cameraInitFuture = cameraController.initialize();
  //   } else {
  //     // Handle case where camera permission is denied
  //     print('Camera permission denied');
  //   }
  // }
  //
  // Future<void> scanQR() async{
  //   try{
  //     scannedQrcode = await  FlutterBarcodeScanner.scanBarcode('#FFFFFF', 'Cancel', true, ScanMode.QR,);
  //
  //     Get.snackbar("Result", "QR Code$scannedQrcode", snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.green, colorText: Colors.white,);
  //   }on PlatformException{
  //
  //   }
  // }
  Future<void> initializeCamera() async {
    // Request camera permission
    final PermissionStatus cameraPermissionStatus = await Permission.camera.request();
    if (cameraPermissionStatus.isGranted) {
      // Get a list of available cameras
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere((camera) => camera.lensDirection == CameraLensDirection.front);

      // Initialize the camera controller with the front camera
      cameraController = CameraController(frontCamera, ResolutionPreset.medium);
      cameraInitFuture = cameraController.initialize();
    } else {
      // Handle case where camera permission is denied
      print('Camera permission denied');
    }
  }

  Future<void> scanQR() async {
    // Ensure that the camera is initialized before scanning QR code
    await cameraInitFuture;

    try {
      final scannedQrcode = await FlutterBarcodeScanner.scanBarcode(
        '#FFFFFF',
        'Cancel',
        true,
        ScanMode.QR,
      );

      // if (scannedQrcode != "-1") {
      //   mcController.text = scannedQrcode;
      //   // Check if QR scanning was successful
      //   Get.snackbar(
      //     "Result",
      //     "QR Code $scannedQrcode",
      //     snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.green,
      //     colorText: Colors.white,
      //   );
      // } else {
      //   print('QR scanning cancelled or failed.');
      // }
    } catch (e) {
      print('Error scanning QR code: $e');
    }
  }


  Future<void> saveProdData(BuildContext context) async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return;
    }
    saveProductionModelMap['machineNo'] = mcController.text;
    saveProductionModelMap['operator'] = operatorController.text;
    saveProductionModelMap['prod_Barcode'] = prodBarcodeController.text;
    saveProductionModelMap['quantity'] = qtyController.text;
    try {
      ApiResponse apiResponse =
          await AdminRepo().saveProduction(saveProductionModelMap);
      if (checkAPIResponse(apiResponse)) {
        ApiChecker().successMessageGetX(
            header: 'Production Data', message: 'Saved Successfully');
      }
    } catch (e) {
      rapidSoftPrint(e);
      Map<String, dynamic> exceptionModelMap = {};
      exceptionModelMap['methodName'] = 'saveData';
      exceptionModelMap['parameter'] = '$saveProductionModelMap';
      exceptionModelMap['exMessage'] = '$e';
    }
    update();
  }
}
