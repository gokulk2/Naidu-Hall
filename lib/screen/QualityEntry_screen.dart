import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controller/qualityentry_controller.dart';
import '../custom_widget/alert_message.dart';
import '../custom_widget/text_form_field.dart';
import '../model/response/api_checker.dart';
import '../repository/signalrrepo.dart';

class QualityEntryScreen extends GetView<QualityEntryController> {
  QualityEntryScreen({super.key});

  final qualityEntryController = Get.put(QualityEntryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QualityEntryController>(
      initState: (state) {
        // controller.onBuilderInit();
      },
      builder: (controller) {
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
              title: const Text('Quality Entry'),
              backgroundColor: Colors.red,
              actions: [
                IconButton(
                  onPressed: () {
                    ApiChecker().functionAlert(
                      "Logout",
                      "Are you sure want to Logout?",
                      () {
                        SignalRRepo.terminateConnection();
                        //Navigator.pushNamed(context, '/login');
                      },
                    );
                  },
                  icon: const Icon(
                    FontAwesomeIcons.powerOff,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
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
                          minimumSize: MaterialStateProperty.all<Size>(
                              const Size(400, 40)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.qr_code),
                            SizedBox(width: 8),
                            Text(
                              'Scan',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
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
                          hintText: 'Enter M/C # here',
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
                          hintText: 'Enter Operator # here',
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
                          hintText: 'Enter Qty here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rejection',
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
                              // controller.operatorEvent(context);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              // controller.operatorEvent(context);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Rework Station',
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
                              // controller.operatorEvent(context);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 120,
                            child: MaterialButton(
                              onPressed: () {
                                controller.mcController.clear();
                                controller.operatorController.clear();
                                controller.qcQtyController.clear();
                              },
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: const Text('Clear',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 120,
                            child: MaterialButton(
                              onPressed: () {
                                // Handle button press
                              },
                              color: Colors.green,
                              textColor: Colors.white,
                              child: const Text('Operator',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 120,
                            child: MaterialButton(
                              onPressed: () {
                                controller.saveQualityData(context);
                              },
                              color: Colors.orange,
                              textColor: Colors.white,
                              child: const Text('Confirm',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
