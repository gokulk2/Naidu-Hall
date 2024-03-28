class JsonDataSeparatorModel {
  var data;
  var totalRecord;
  var pageIndex;
  var pageSize;
  JsonDataSeparatorModel(
      {this.data, this.totalRecord, this.pageIndex, this.pageSize});
  JsonDataSeparatorModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    totalRecord = json['totalRecords'];
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
  }
}

class AddressModel {
  var data;
  AddressModel({
    this.data,
  });
  AddressModel.fromJson(Map<String, dynamic> json) {
    data = json['suggestions'];
  }
}

class AddressVerifiedModel {
  var data;
  AddressVerifiedModel({
    this.data,
  });

  AddressVerifiedModel.fromJson(Map<String, dynamic> json) {
    data = json['candidates'];
  }
}
