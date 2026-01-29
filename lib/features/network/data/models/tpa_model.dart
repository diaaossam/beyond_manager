
class TpaModel {
  TpaModel(
      {this.companies, this.tpaId, this.tpaName, this.logo, this.lastUpdate});

  TpaModel.fromJson(dynamic json) {
    List<Company> companiesList = [];
    if (json['companies'] != null) {
      json['companies'].forEach((element) {
        companiesList.add(Company.fromJson(element));
      });
    }
    companies = companiesList;
    tpaId = json['tpa_id'];
    tpaName = json['tpa_name'];
    logo = json['logo'] ?? "";
    lastUpdate = json['last_update'] ?? "";
  }

  List<Company>? companies;
  num? tpaId;
  String? tpaName;
  String? logo;
  String? lastUpdate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['companies'] = companies;
    map['tpa_id'] = tpaId;
    map['tpa_name'] = tpaName;
    map['logo'] = logo;
    return map;
  }

  @override
  String toString() {
    return tpaName ?? "";
  }
}

class Company {
  final int id;
  final String name;
  final String logo;

  Company({
    required this.id,
    required this.name,
    required this.logo,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json["name"],
      logo: json["logo"] ?? "",
    );
  }

  @override
  String toString() {
    return name;
  }

  List<dynamic> toJson() {
    return [id, name];
  }
}
