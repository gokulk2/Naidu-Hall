import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screen/QualityEntry_screen.dart';
import '../screen/breakdownEntry_screen.dart';
import '../screen/entry_screen.dart';
import '../screen/login_screen.dart';
import '../screen/productionentry_screen.dart';

class RoutePage {
  static final List<GetPage> routes = [
    GetPage(name: '/', page: () => LoginScreen()),
    GetPage(name: '/entry', page: () => EntryScreen()),
    GetPage(name: '/production', page: () => ProductionEntryScreen()),
    GetPage(name: '/quality', page: () => QualityEntryScreen()),
    GetPage(name: '/breakDown', page: () => BreakDownEntryScreen()),
  ];
}
