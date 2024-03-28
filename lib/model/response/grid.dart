class GridViewModel {
  String title;
  String? sortColumnName;
  String dataModelName;
  dynamic widget;
  bool expanded;
  double width;
  GridViewModel({
    required this.title,
    this.sortColumnName,
    required this.dataModelName,
    this.widget,
    this.expanded = false,
    required this.width,
  });
}
