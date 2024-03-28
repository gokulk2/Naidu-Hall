import 'package:flutter/material.dart';

class MenuModel {
  int menuId;
  String menuName;
  Function? routeFunction;
  IconData iconData;
  bool expand;
  String visibilityEnumName;

  MenuModel({
    required this.menuId,
    required this.menuName,
    this.routeFunction,
    required this.iconData,
    this.expand = false,
    required this.visibilityEnumName,
  });
}

class SubMenuModel {
  int subMenuId;
  int menuId;
  String subMenuName;
  Function subRouteFunction;
  IconData iconData;

  SubMenuModel({
    required this.subMenuId,
    required this.menuId,
    required this.subMenuName,
    required this.iconData,
    required this.subRouteFunction,
  });
}
