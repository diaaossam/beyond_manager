class GenericModel {
  final int id;
  final String name;

  GenericModel({required this.id, required this.name});

  factory GenericModel.fromJson(List<dynamic> json) {
    return GenericModel(id: json[0], name: json[1]);
  }

  static List<GenericModel> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = response as List<dynamic>;
    return dataList.map((item) => GenericModel.fromJson(item)).toList();
  }

  List<dynamic> toJson() {
    return [id, name];
  }
}
