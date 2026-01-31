import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

class HospitalsModel extends Equatable {
  const HospitalsModel({
    this.actif,
    this.code,
    this.dateCreate,
    this.designation,
    this.designationAr,
    this.ipAdress,
    this.logo,
  });

  static List<HospitalsModel> fromJsonList(dynamic response) {
    return response
        .map<HospitalsModel>((item) => HospitalsModel.fromJson(item))
        .toList();
  }

  factory HospitalsModel.fromJson(Map<String, dynamic> json) {
    return HospitalsModel(
      actif: json['actif'] as bool?,
      code: json['code'] as num?,
      dateCreate: json['dateCreate'] as num?,
      designation: json['designation'] as String?,
      designationAr: json['designationAr'] as String?,
      ipAdress: json['ipAdress'] as String?,
      logo: json['logo'] as String?,
    );
  }

  final bool? actif;
  final num? code;
  final num? dateCreate;
  final String? designation;
  final String? designationAr;
  final String? ipAdress;
  final String? logo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['actif'] = actif;
    map['code'] = code;
    map['dateCreate'] = dateCreate;
    map['designation'] = designation;
    map['designationAr'] = designationAr;
    map['ipAdress'] = ipAdress;
    map['logo'] = logo;
    return map;
  }

  @override
  List<Object?> get props => [
    actif,
    code,
    dateCreate,
    designation,
    designationAr,
    ipAdress,
    logo,
  ];
}
