import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/app_constants.dart';
import '../controller/productionEntry_controller.dart';
import '../custom_widget/alert_message.dart';
import '../custom_widget/logout_handler.dart';

class ProductionEntryScreen extends GetView<ProductionEntryController> {
  ProductionEntryScreen({Key? key}) : super(key: key);
  final productionEntryController = Get.put(ProductionEntryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductionEntryController>(initState: (state) {},
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
            appBar: PMDAppBar(context, 'Production Entry'),
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
                      PMDText(text: 'Product Barcode'),
                      sizedBox8(),
                      PMDTextField(controller: controller.prodBarcodeController, hintText: 'Enter Prod.Barcode here'),
                      sizedBox16(),
                      PMDText(text:'Quantity'),
                      sizedBox8(),
                      PMDTextField(controller: controller.qtyController, hintText: 'Enter Quantity here'),
                      const SizedBox(height: 200),
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
                                controller.prodBarcodeController.clear();
                                controller.qtyController.clear();
                              },
                              color: Colors.blue,
                              textColor: Colors.white,
                              child: PMDText(text:'Clear'),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 120,
                            child: MaterialButton(
                              onPressed: () {
                                controller.saveProdData(context);
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