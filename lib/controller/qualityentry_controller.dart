import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
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
    qcQtyController.dispose();
  }
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
