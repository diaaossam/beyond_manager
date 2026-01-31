import 'hospitals_model.dart';

class SpecialityModel {
  SpecialityModel({
    this.code,
    this.codeCostCentre,
    this.codeSpecialSkills,
    this.designation,
    this.designationAr,
    this.familleSpecialite,
    this.prefixe,
    this.sites,
    this.suffixe,
  });

  static List<SpecialityModel> fromJsonList(dynamic response) {
    return response
        .map<SpecialityModel>((item) => SpecialityModel.fromJson(item))
        .toList();
  }

  SpecialityModel.fromJson(dynamic json) {
    code = json['code'];
    codeCostCentre = json['codeCostCentre'];
    codeSpecialSkills = json['codeSpecialSkills'];
    designation = json['designation'];
    designationAr = json['designationAr'];
    familleSpecialite = json['familleSpecialite'] != null
        ? HospitalsModel.fromJson(json['familleSpecialite'])
        : null;
    prefixe = json['prefixe'];
    if (json['sites'] != null) {
      sites = [];
      json['sites'].forEach((v) {
        sites?.add(HospitalsModel.fromJson(v));
      });
    }
    suffixe = json['suffixe'];
  }

  num? code;
  dynamic codeCostCentre;
  dynamic codeSpecialSkills;
  String? designation;
  String? designationAr;
  HospitalsModel? familleSpecialite;
  String? prefixe;
  List<HospitalsModel>? sites;
  String? suffixe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['codeCostCentre'] = codeCostCentre;
    map['codeSpecialSkills'] = codeSpecialSkills;
    map['designation'] = designation;
    map['designationAr'] = designationAr;
    if (familleSpecialite != null) {
      map['familleSpecialite'] = familleSpecialite?.toJson();
    }
    map['prefixe'] = prefixe;
    if (sites != null) {
      map['sites'] = sites?.map((v) => v.toJson()).toList();
    }
    map['suffixe'] = suffixe;
    return map;
  }
}
