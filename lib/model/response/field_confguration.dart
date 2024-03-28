class FieldConfigurationModel {
  int? id;
  int? pageConfigurationID;
  String? name;
  String? displayName;
  int? dataType;
  bool? mandatory ;
  bool? highlight;
  int? controlType;
  String? domainName;
  String? tableName;
  int? sortOrder;
  String? modelName;
  String? defaultValue;
  int? maximumLength;
  bool? readOnly;
  bool? isDeleted;

  FieldConfigurationModel({
    this.id,
    this.pageConfigurationID,
    this.name,
    this.displayName,
    this.dataType,
    this.mandatory,
    this.highlight,
    this.controlType,
    this.domainName,
    this.sortOrder,
    this.tableName,
    this.modelName,
    this.defaultValue,
    this.readOnly,
    this.maximumLength,
    this.isDeleted,
  });

  FieldConfigurationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageConfigurationID = json['pageConfigurationID'];
    name = json['name'];
    displayName = json['displayName'];
    mandatory = json['mandatory'];
    highlight = json['highLight'];
    controlType = json['controlType'];
    domainName = json['domainName'];
    sortOrder = json['sortOrder'];
    tableName = json['tableName'];
    modelName = json['modelName'];
    defaultValue = json['default'];
    readOnly = json['readOnly'];
    maximumLength = json['maximumLength'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pageConfigurationID'] = pageConfigurationID;
    data['name'] = name;
    data['displayName'] = displayName;
    data['mandatory'] = mandatory;
    data['highlight'] = highlight;
    data['controlType'] = controlType;
    data['domainName'] = domainName;
    data['sortOrder'] = sortOrder;
    data['tableName'] = tableName;
    data['modelName'] = modelName;
    data['defaultValue'] = defaultValue;
    data['readOnly'] = readOnly;
    data['maximumLength'] = maximumLength;
    data['isDeleted'] = isDeleted;
    return data;
  }
}