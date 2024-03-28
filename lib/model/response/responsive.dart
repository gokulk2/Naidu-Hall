import 'package:flutter/material.dart';

class FieldResponsive {
  int sortOrder = 0;
  bool isDeleted = false;
  Widget? widget;
  bool needDivider = false;
  int fieldWidth;

  FieldResponsive({
    required this.sortOrder,
    required this.isDeleted,
    required this.widget,
    this.needDivider = false,
    this.fieldWidth = 6,
  });
}
class WidgetVisibilityResponsive {
  String modelName;
  FieldResponsive fieldResponsive;
  WidgetVisibilityResponsive({
    required this.modelName,
    required this.fieldResponsive,
  });
}