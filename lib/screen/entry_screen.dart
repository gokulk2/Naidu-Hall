import 'package:NaiduHall/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../custom_widget/alert_message.dart';
import '../custom_widget/logout_handler.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key});

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
        appBar:PMDAppBar(context,'Entry Screen'),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text('Select the Category',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/production');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: const Size(350, 50),
                ),
                child: PMDText(text: 'Production Entry'),
              ),
              const SizedBox(
                height: 90,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/quality');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: const Size(350, 50),
                ),
                child: PMDText(text: 'Quality Entry'),
              ),
              const SizedBox(
                height: 90,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/breakDown');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: const Size(350, 50),
                ),
                child: PMDText(text: 'Breakdown Entry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}