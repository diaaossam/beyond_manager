class GenericModel {
  final int id;
  final String name;

  GenericModel({required this.id, required this.name});

  factory GenericModel.fromJson(List<dynamic> json) {
    return GenericModel(id: json[0], name: json[1]);
  }
  factory GenericModel.fromJsonName(Map<String,dynamic> json) {
    return GenericModel(id: json['id'], name: json["name"]);
  }

  static List<GenericModel> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = (response['result']) as List<dynamic>;
    return dataList.map<GenericModel>((item) => GenericModel.fromJsonName(item)).toList();
  }

  List<dynamic> toJson() {
    return [id, name];
  }
}
