// import 'dart:io' show Platform;
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// import '../controller/QRScannerController.dart';
//
// class QRScannerScreen extends StatelessWidget {
//   final QRScannerController controller = Get.put(QRScannerController());
//
//   QRScannerScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     if (Platform.isWindows) {
//       return const Scaffold(
//         body: Center(
//           child: Text('QR scanning is not supported on Windows.'),
//         ),
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Scan QR Code'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//               width: 200,
//               height: 200,
//               child: GetBuilder<QRScannerController>(
//                 builder: (_) => QRView(
//                   key: controller.qrKey,
//                   onQRViewCreated: controller.onQRViewCreated,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controller/QRScannerController.dart';
//
// class HomeScreen extends StatelessWidget {
//   final HomeController controller = Get.put(HomeController());
//
//   HomeScreen({Key? key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false, // Prevent keyboard from overlaying widgets
//       body: SingleChildScrollView( // Enable scrolling to avoid overflow
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 40.0), // Adjust vertical padding
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.pink,
//                     borderRadius: BorderRadius.circular(10.0), // Rounded corners
//                   ),
//                   child: const SizedBox(
//                     width: 300, // Adjust the width as needed
//                     height: 50, // Adjust the height as needed
//                     child: Center(
//                       child: Text(
//                         'Production Entry',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//                 ElevatedButton( // Button for scanning machine barcode
//                   onPressed: () {
//                     // Implement functionality to scan machine barcode
//                     // For example:
//                     // controller.scanMachineBarcode();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.grey, // Button color
//                   ),
//                   child: const Text(
//                     'Scan Machine Barcode',
//                     style: TextStyle(color: Colors.black87),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 buildTextFormFieldWithLabel('M/C#'),
//                 buildTextFormFieldWithLabel('Operator#'),
//                 buildTextFormFieldWithLabel('Prod.Barcode'),
//                 buildTextFormFieldWithLabel('Qty'),
//                 const SizedBox(height: 20), // Adjust vertical spacing
//
//                 const SizedBox(height: 20), // Adjust vertical spacing
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         // Implement Clear functionality
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.orange.shade200, // Button color
//                       ),
//                       child: const Text(
//                         'CLEAR',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Implement Operator functionality
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.orange.shade200, // Button color
//                       ),
//                       child: const Text(
//                         'Operator',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         // Implement Confirm functionality
//                       },
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.orange.shade200, // Button color
//                       ),
//                       child: const Text(
//                         'CONFIRM',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 50), // Adjust vertical spacing
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.pink,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.home),
//               onPressed: () {
//                 // Navigate to home screen or implement other functionality
//               },
//             ),
//             IconButton(
//               icon: const Icon(Icons.notifications),
//               onPressed: () {
//                 // Navigate to notifications screen or implement other functionality
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.settings),
//               onPressed: () {
//                 // Navigate to settings screen or implement other functionality
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildTextFormFieldWithLabel(String labelText) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: <Widget>[
//           SizedBox(
//             width: 100, // Adjust the width as needed
//             child: Text(
//               labelText,
//               textAlign: TextAlign.left,
//             ),
//           ),
//           SizedBox(
//             width: 200, // Adjust the width as needed
//             height: 40,
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
//
// class QRScannerScreen extends StatefulWidget {
//   @override
//   _QRScannerScreenState createState() => _QRScannerScreenState();
// }
//
// class _QRScannerScreenState extends State<QRScannerScreen> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   late QRViewController controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan QR Code'),
//       ),
//       body: QRView(
//         key: qrKey,
//         onQRViewCreated: _onQRViewCreated,
//       ),
//     );
//   }
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       print('QR Code scanned: ${scanData.code}');
//       Navigator.pop(context, scanData.code);
//     });
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
// }

