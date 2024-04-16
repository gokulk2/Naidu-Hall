import 'dart:async';

import 'package:NaiduHall/constant/page_enum.dart';

String currentPage = PageName.login.name;
StreamController<bool> homeWidgetsStreamController = StreamController<bool>();
StreamController<bool> addCallWidgetsStreamController =
    StreamController<bool>();

///Grid Events Name

bool visibleMenu = true;

String version = 'v3.0.10';
