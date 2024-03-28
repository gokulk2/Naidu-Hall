import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobileapp/screen/QRScannerScreen.dart';
import 'package:mobileapp/screen/QualityEntry_screen.dart';
import 'package:mobileapp/screen/breakdownEntry_screen.dart';
import 'package:mobileapp/screen/entry_screen.dart';
import 'package:mobileapp/screen/login_screen.dart';

import 'package:mobileapp/screen/productionentry_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => LoginScreen()),
        GetPage(name: '/dashboard', page: () => EntryScreen()),
        GetPage(name: '/production', page: () => ProductionEntryScreen()),
        GetPage(name: '/quality', page: () => QualityEntryScreen()),
        GetPage(name: '/breakDown', page: () => BreakDownEntryScreen()),
      ],
    );
  }
}
