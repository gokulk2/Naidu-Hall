import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../constant/app_constants.dart';
import '../model/response/api_checker.dart';
import '../model/response/api_response.dart';
import '../repository/admin_repo.dart';

class BreakDownEntryController extends GetxController {
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> saveBreakDownModelMap = {};
  TextEditingController mcController = TextEditingController();
  TextEditingController operatorController = TextEditingController();
  List<String> dropdownItems = [
    '',
    'Power Out',
    'Partial No Load',
  ];
  String dropdownValue = '';

  List<String> dropdownStatusItems = [
    '',
    'OK',
  ];

  String dropdownStatusValue = '';

  List<String> dropdownItems1 = [
    '',
    '0 - 30',
    '0 - 60',
  ];
  String dropdownValue1 = '';
  bool isLoading = false;

  RxBool saveButtonVisible = false.obs;
  late CameraController cameraController;
  late Future<void> cameraInitFuture;

  @override
  void onInit() {
    super.onInit();
    onBuilderInit();
    initializeCamera();
  }

  onBuilderInit() async {}

  @override
  void onClose() {
    super.onClose();
    mcController.dispose();
    operatorController.dispose();
  }

  void setDropdownVisibility(bool isVisible) {
    saveButtonVisible.value = isVisible;
    update();
  }

  Future<void> initializeCamera() async {
    final PermissionStatus cameraPermissionStatus =
        await Permission.camera.request();
    if (cameraPermissionStatus.isGranted) {
      final cameras = await availableCameras();
      final frontCamera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front);

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

  Future<void> saveBreakDownData(BuildContext context) async {
    formKey.currentState!.save();
    if (!formKey.currentState!.validate()) {
      return;
    }
    saveBreakDownModelMap['machineNo'] = mcController.text;
    saveBreakDownModelMap['operator'] = operatorController.text;
    saveBreakDownModelMap['reason'] = dropdownValue;
    saveBreakDownModelMap['status'] = dropdownStatusValue;

    try {
      ApiResponse apiResponse =
          await AdminRepo().saveBreakDown(saveBreakDownModelMap);
      if (checkAPIResponse(apiResponse)) {
        ApiChecker().successMessageGetX(
            header: 'BreakDown Data', message: 'Saved Successfully');
      }
    } catch (e) {
      rapidSoftPrint(e);
      Map<String, dynamic> exceptionModelMap = {};
      exceptionModelMap['methodName'] = 'saveBreakDownData';
      exceptionModelMap['parameter'] = '$saveBreakDownModelMap';
      exceptionModelMap['exMessage'] = '$e';
    }
    update();
  }

  void operatorEvent(BuildContext context) {
    if (dropdownValue == 'Power Out') {
      setDropdownVisibility(true);
    } else if (dropdownValue == 'Partial No Load') {
      setDropdownVisibility(true);
    } else {
      setDropdownVisibility(false);
    }
  }

  bool selectedDropDownValue() {
    return dropdownValue != null && dropdownValue.isNotEmpty;
  }
}
