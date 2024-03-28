class GridResponseModel {
  List data;
  int totalRecord;
  int pageIndex;
  int pageSize;

  GridResponseModel({
    required this.data,
    required this.totalRecord,
    required this.pageIndex,
    required this.pageSize,
  });

  factory GridResponseModel.fromJson(Map<String, dynamic> json) =>
      GridResponseModel(
        data: json['data'] ?? [],
        totalRecord: json['totalRecords'] ?? 0,
        pageIndex: json['pageIndex'] ?? 0,
        pageSize: json['pageSize'] ?? 0,
      );
}
