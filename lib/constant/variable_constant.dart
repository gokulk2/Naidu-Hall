import 'dart:async';

import 'package:mobileapp/constant/page_enum.dart';

String currentPage = PageName.login.name;
double defaultBodyWidth = 35;
StreamController<bool> homeWidgetsStreamController = StreamController<bool>();
StreamController<bool> addCallWidgetsStreamController =
    StreamController<bool>();
String phoneNumberFormat = "000-000-0000";
List<Map<String, dynamic>> pageRouteCollections = [];
bool isNotBackRoute = true;

///Grid Events Name
String increaseEvent = 'increase';
String decreaseEvent = 'decrease';
String startEvent = 'start';
String endEvent = 'end';

bool visibleMenu = true;

String version = 'v3.0.10';
