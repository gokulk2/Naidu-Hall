// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mobileapp/controller/breakdownentry_controller.dart';
//
// import '../constant/app_constants.dart';
// import '../custom_widget/text_form_field.dart';
// // Assuming PMDButton1 is imported from pmd_button.dart
//
// class BreakDownEntryScreen extends GetView<BreakDownEntryController> {
//   BreakDownEntryScreen({super.key});
//
//   final breakDownEntryController = Get.put(BreakDownEntryController());
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<BreakDownEntryController>(
//       init: BreakDownEntryController(), // Initialize controller here
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
//                       closeButtonName: 'BreakDown Entry',
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
//                     RSDropdownFormField<String>(
//                       width: 320,
//                       // Change the type according to your data type
//                       value: controller.dropdownValue,
//                       // Provide the correct value
//                       items: controller.dropdownItems,
//                       // Provide the correct list of items
//                       onChanged: (value) {
//                         controller.dropdownValue = value!;
//                         // Implement onChanged functionality
//                       },
//                       displayName: 'Reason', // Provide the display name
//                     ),
//                     Visibility(
//                       visible: controller.selectedDropDownValue() &&
//                           controller.saveButtonVisible.value &&
//                           controller.dropdownValue != null &&
//                           controller.dropdownValue == 'Power Out',
//                       child: Column(
//                         children: [
//                           const SizedBox(height: 20),
//                           RSDropdownFormField<String>(
//                             width: 320,
//                             value: controller.dropdownstatusValue,
//                             items: controller.dropdownstatusItems,
//                             onChanged: (value) {
//                               controller.operatorEvent(context);
//                             },
//                             displayName: 'Status',
//                           ),
//                         ],
//                       ),
//                     ),
//                     Visibility(
//                       visible: controller.selectedDropDownValue() &&
//                           controller.saveButtonVisible.value &&
//                           controller.dropdownValue != null &&
//                           controller.dropdownValue == 'Partial No Load',
//                       child: Column(
//                         children: [
//                           const SizedBox(height: 20),
//                           RSDropdownFormField<String>(
//                             width: 320,
//                             value: controller.dropdownValue1,
//                             items: controller.dropdownItems1,
//                             onChanged: (value) {
//                               controller.operatorEvent(context);
//                             },
//                             displayName: 'Timing',
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 40),
//                     PMDButton1(
//                       saveEnabled: true,
//                       cancelEvent: (context) {
//                         // Implement cancelEvent functionality
//                         controller.mcController.clear();
//                         controller.operatorController.clear();
//                         controller.qcQtyController.clear();
//                       },
//                       saveEvent: (context) {
//                         // Implement saveEvent functionality
//                       },
//                       operatorEvent: (context) {
//                         controller.operatorEvent(context);
//                         // Implement operatorEvent functionality
//                       },
//                       cancelButtonName: 'CLEAR',
//                       operatorButtonName: 'CONFIRM',
//                       saveButtonName: 'Change M/C',
//                       saveButtonVisible: controller.saveButtonVisible.value,
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
import 'package:mobileapp/custom_widget/text_form_field.dart';
import '../constant/app_constants.dart';
import '../controller/breakdownentry_controller.dart';
import '../custom_widget/alert_message.dart';

class BreakDownEntryScreen extends GetView<BreakDownEntryController> {
  BreakDownEntryScreen({Key? key}) : super(key: key);

  final breakDownEntryController = Get.put(BreakDownEntryController());

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
      child: GetBuilder<BreakDownEntryController>(
          init: BreakDownEntryController(), // Initialize controller here
          initState: (state) {
            controller.onBuilderInit();
          },
          builder: (ctx) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Breakdown Entry'),
                backgroundColor: Colors.red,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
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
                        'Qty',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: controller.qcQtyController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your text here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Reason',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomDropdownFormField(
                        value: controller.dropdownValue,
                        items: controller.dropdownItems,
                        onChanged: (value) {
                          controller.dropdownValue = value!;
                        },
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: controller.selectedDropDownValue() &&
                            controller.saveButtonVisible.value &&
                            controller.dropdownValue != null &&
                            controller.dropdownValue == 'Power Out',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Status',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomDropdownFormField(
                              value: controller.dropdownstatusValue,
                              items: controller.dropdownstatusItems,
                              onChanged: (value) {
                                controller.operatorEvent(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: controller.selectedDropDownValue() &&
                            controller.saveButtonVisible.value &&
                            controller.dropdownValue != null &&
                            controller.dropdownValue == 'Partial No Load',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Timing',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomDropdownFormField(
                              value: controller.dropdownValue1,
                              items: controller.dropdownItems1,
                              onChanged: (value) {
                                controller.operatorEvent(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const SizedBox(height: 8),
                      PMDButton1(
                        saveEnabled: true,
                        cancelEvent: (context) {
                          // Implement cancelEvent functionality
                          controller.mcController.clear();
                          controller.operatorController.clear();
                          controller.qcQtyController.clear();
                        },
                        saveEvent: (context) {
                          // Implement saveEvent functionality
                        },
                        operatorEvent: (context) {
                          controller.operatorEvent(context);
                          // Implement operatorEvent functionality
                        },
                        cancelButtonName: 'CLEAR',
                        operatorButtonName: 'CONFIRM',
                        saveButtonName: 'Change M/C',
                        saveButtonVisible: controller.saveButtonVisible.value,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
