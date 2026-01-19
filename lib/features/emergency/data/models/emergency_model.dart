class EmergencyModel {
  EmergencyModel({
    this.date,
    this.id,
    this.name,
    this.note,
    this.requestType,
    this.state,
  });

  EmergencyModel.fromJson(dynamic json) {
    date = json['Date'];
    id = json['Id'];
    name = json['Name'];
    note = json['Note'];
    requestType = json['Request Type'];
    state = json['State'];
  }

  String? date;
  num? id;
  String? name;
  String? note;
  String? requestType;
  String? state;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Date'] = date;
    map['Id'] = id;
    map['Name'] = name;
    map['Note'] = note;
    map['Request Type'] = requestType;
    map['State'] = state;
    return map;
  }
}
