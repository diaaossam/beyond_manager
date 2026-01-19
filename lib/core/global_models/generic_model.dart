class GenericModel {
  final int id;
  final String name;

  GenericModel({required this.id, required this.name});

  factory GenericModel.fromJson(List<dynamic> json) {
    return GenericModel(id: json[0], name: json[1]);
  }

  List<dynamic> toJson() {
    return [id, name];
  }
}
