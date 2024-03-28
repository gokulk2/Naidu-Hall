// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../constant/app_constants.dart';
// import '../controller/productionEntry_controller.dart';
// import '../custom_widget/text_form_field.dart';
//
// class ProductionEntryScreen extends GetView<ProductionEntryController> {
//   ProductionEntryScreen({super.key});
//
//   final productionEntryController = Get.put(ProductionEntryController());
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ProductionEntryController>(
//       init: ProductionEntryController(), // Initialize controller here
//       initState: (state) {
//         controller.onBuilderInit();
//       },
//       builder: (ctx) {
//         return SafeArea(
//           child: Material(
//             child: Center(
//               child: Container(
//                 padding: const EdgeInsets.all(20.0),
//                 decoration: const BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: Color(0xFFFF6666),
//                       width: 30.0,
//                     ),
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     PMDButton2(
//                       closeButtonName: 'Production Entry',
//                       closeEvent: (BuildContext) {},
//                     ),
//                     const SizedBox(height: 30),
//                     ScanButton(
//                       saveEnabled: true,
//                       saveEvent: (context) {
//                         // Implement saveEvent functionality
//                       },
//                       saveButtonName: 'Scan Machine Barcode',
//                     ),
//                     const SizedBox(height: 20),
//                     RSTextFormField(
//                       width: 320,
//                       onChangedEvent: (value) {},
//                       onSavedEvent: (value) {},
//                       onFieldSubmitted: (value) {
//                         controller.login();
//                       },
//                       textEditingController: controller.mcController,
//                       displayName: 'M/C #',
//                     ),
//                     const SizedBox(height: 20),
//                     RSTextFormField(
//                       width: 320,
//                       onChangedEvent: (value) {},
//                       onSavedEvent: (value) {},
//                       onFieldSubmitted: (value) {
//                         controller.login();
//                       },
//                       textEditingController: controller.operatorController,
//                       displayName: 'Operator #',
//                     ),
//                     const SizedBox(height: 20),
//                     RSTextFormField(
//                       width: 320,
//                       onChangedEvent: (value) {},
//                       onSavedEvent: (value) {},
//                       onFieldSubmitted: (value) {
//                         controller.login();
//                       },
//                       textEditingController: controller.prodBarcodeController,
//                       displayName: 'Prod.Barcode',
//                     ),
//                     const SizedBox(height: 20),
//                     RSTextFormField(
//                       width: 320,
//                       onChangedEvent: (value) {},
//                       onSavedEvent: (value) {},
//                       onFieldSubmitted: (value) {
//                         controller.login();
//                       },
//                       textEditingController: controller.qtyController,
//                       displayName: 'Qty',
//                     ),
//                     const SizedBox(height: 40),
//                     PMDButton1(
//                       saveEnabled: true,
//                       cancelEvent: (context) {
//                         // Implement cancelEvent functionality
//                         controller.mcController.clear();
//                         controller.operatorController.clear();
//                         controller.prodBarcodeController.clear();
//                         controller.qtyController.clear();
//                       },
//                       operatorEvent: (context) {
//                         // Implement operatorEvent functionality
//                       },
//                       saveEvent: (context) {
//                         // Implement saveEvent functionality
//                       },
//                       cancelButtonName: 'CLEAR',
//                       operatorButtonName: 'Operator',
//                       saveButtonName: 'CONFIRM',
//                       saveButtonVisible: true,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/productionEntry_controller.dart';
import '../custom_widget/alert_message.dart';

class ProductionEntryScreen extends GetView<ProductionEntryController> {
  ProductionEntryScreen({Key? key}) : super(key: key);
  final productionEntryController = Get.put(ProductionEntryController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exit = await showDialog(
          context: context,
          builder: (context) => const ExitAlertDialog(),
        );
        return exit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Production Entry'),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement scan functionality here
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.qr_code),
                      SizedBox(width: 8),
                      Text('Scan'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'M/C #',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.mcController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your text here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Operator #',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.operatorController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your text here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Prod.Barcode',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.prodBarcodeController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your text here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Qty',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: controller.qtyController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your text here',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: MaterialButton(
                        onPressed: () {
                          controller.mcController.clear();
                          controller.operatorController.clear();
                          controller.prodBarcodeController.clear();
                          controller.qtyController.clear();
                        },
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: const Text('Clear'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: MaterialButton(
                        onPressed: () {
                          // Handle button press
                        },
                        color: Colors.green,
                        textColor: Colors.white,
                        child: const Text('Operator'),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                      child: MaterialButton(
                        onPressed: () {
                          // Handle button press
                        },
                        color: Colors.orange,
                        textColor: Colors.white,
                        child: const Text('Confirm'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
