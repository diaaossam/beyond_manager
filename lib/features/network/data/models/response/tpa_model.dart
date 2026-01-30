import 'package:bond/core/utils/app_strings.dart';

class TpaModel {
  TpaModel({
    this.companies,
    this.tpaId,
    this.tpaName,
    this.logo,
    this.lastUpdate,
  });

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
    logo = json['logo'] ?? AppStrings.defaultLogo;
    lastUpdate = json['last_update'] ?? "";
  }

  static List<TpaModel> fromJsonList(dynamic json) {
    if (json is List) {
      return json.map<TpaModel>((e) => TpaModel.fromJson(e)).toList();
    }
    return [];
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

  Company({required this.id, required this.name, required this.logo});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json["name"],
      logo: json["logo"] ?? AppStrings.defaultLogo,
    );
  }

  static List<Company> fromJsonList(dynamic json) {
    if (json is List) {
      return json.map<Company>((e) => Company.fromJson(e)).toList();
    }
    return [];
  }

  @override
  String toString() {
    return name;
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'logo': logo};
  }
}
