import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_constants.dart';
import '../controller/breakdownentry_controller.dart';
import '../custom_widget/alert_message.dart';
import '../custom_widget/text_form_field.dart';

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
          init: BreakDownEntryController(),
          initState: (state) {
            controller.onBuilderInit();
          },
          builder: (ctx) {
            return Scaffold(
              appBar:PMDAppBar(context, 'Breakdown Entry'),
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
                        PMDText(text: 'Operator Name'),
                        sizedBox8(),
                        PMDTextField(controller: controller.operatorController, hintText: 'Enter Operator Name here'),
                        sizedBox16(),
                        PMDText(text: 'Machine No'),
                        sizedBox8(),
                        PMDTextField(controller: controller.mcController, hintText: 'Enter Machine No here'),
                        sizedBox16(),
                        PMDText(text: 'Reason'),
                        sizedBox8(),
                        CustomDropdownFormField(
                          value: controller.dropdownValue,
                          items: controller.dropdownItems,
                          onChanged: (value) {
                            controller.dropdownValue = value!;
                          },
                        ),
                        sizedBox16(),
                        Visibility(
                          visible: controller.selectedDropDownValue() &&
                              controller.saveButtonVisible.value &&
                              controller.dropdownValue != null &&
                              controller.dropdownValue == 'Power Out',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PMDText(text: 'Status'),
                              sizedBox8(),
                              CustomDropdownFormField(
                                value: controller.dropdownStatusValue,
                                items: controller.dropdownStatusItems,
                                onChanged: (value) {
                                  controller.dropdownStatusValue = value;
                                  controller.operatorEvent(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                          visible: controller.selectedDropDownValue() &&
                              controller.saveButtonVisible.value &&
                              controller.dropdownValue != null &&
                              controller.dropdownValue == 'Partial No Load',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PMDText(text: 'Timing'),
                              sizedBox8(),
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
                        const SizedBox(height: 150),
                        PMDButton1(
                          saveEnabled: true,
                          cancelEvent: (context) {
                            controller.mcController.clear();
                            controller.operatorController.clear();
                          },
                          saveEvent: (context) {
                            controller.saveBreakDownData(context);
                          },
                          operatorEvent: (context) {
                            controller.operatorEvent(context);
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
              ),
            );
          }),
    );
  }
}