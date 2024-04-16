import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_constants.dart';
import '../controller/qualityentry_controller.dart';
import '../custom_widget/alert_message.dart';
import '../custom_widget/logout_handler.dart';
import '../custom_widget/text_form_field.dart';

class QualityEntryScreen extends GetView<QualityEntryController> {
  QualityEntryScreen({super.key});

  final qualityEntryController = Get.put(QualityEntryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QualityEntryController>(initState: (state) {},
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
            appBar:
            PMDAppBar(context, 'Quality Entry'),
            body: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PMDQRScanButton(onPressed: (){
                        controller.scanQR();
                      }),
                      sizedBox20(),
                      PMDText(text:'Operator Name'),
                      sizedBox8(),
                      PMDTextField(controller: controller.operatorController, hintText: 'Enter Operator Name here'),
                      sizedBox16(),
                      PMDText(text: 'Machine No'),
                      sizedBox8(),
                      PMDTextField(controller: controller.mcController, hintText: 'Enter Machine No here'),
                      sizedBox16(),
                      PMDText(text: 'Quantity'),
                      sizedBox8(),
                      PMDTextField(controller: controller.qcQtyController, hintText: 'Enter Quantity here'),
                      sizedBox16(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PMDText(text: 'Rejection'),
                          sizedBox8(),
                          CustomDropdownFormField(
                            value: controller.dropdownValue,
                            items: controller.dropdownItems,
                            onChanged: (value) {
                              // controller.operatorEvent(context);
                            },
                          ),
                        ],
                      ),
                      sizedBox16(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PMDText(text: 'Reason'),
                          sizedBox8(),
                          CustomDropdownFormField(
                            value: controller.dropdownValue,
                            items: controller.dropdownItems,
                            onChanged: (value) {
                              // controller.operatorEvent(context);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PMDText(text: 'Rework Station'),
                          sizedBox8(),
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
                              child: PMDText(text: 'Clear'),
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
                              child: PMDText(text:'Confirm'),
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