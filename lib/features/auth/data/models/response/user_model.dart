import 'package:logger/logger.dart';

import '../../../../../core/enum/gender.dart';
import '../../../../../core/global_models/generic_model.dart';

class UserModel {
  dynamic branchIds;
  final List<GenericModel>? companyIds;
  String? email;
  String? jobDescription;
  final List<GenericModel>? id;
  String? name;
  String? firstName;
  String? secondName;
  String? thirdName;
  String? lastName;
  String? birthDate;
  String? phone;
  num? currentCompanyId;
  GenderEnum? genderEnum;
  final List<GenericModel>? policyIds;

  UserModel({
    this.branchIds,
    this.companyIds,
    this.email,
    this.id,
    this.currentCompanyId,
    this.firstName,
    this.jobDescription,
    this.name,
    this.phone,
    this.policyIds,
    this.lastName,
    this.secondName,
    this.genderEnum,
    this.birthDate,
    this.thirdName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      branchIds: json['branch_ids'] ?? [],
      currentCompanyId: json['current_company_id'] ?? 0,
      companyIds: json['company_ids'] != null
          ? (json['company_ids'] as List)
                .map((item) => GenericModel.fromJson(item))
                .toList()
          : [],
      email: json['email'] ?? '',
      id: json['id'] != null
          ? (json['id'] as List)
                .map((item) => GenericModel.fromJson(item))
                .toList()
          : [],
      name: json['name'] ?? '',
      secondName: json['second_name'] ?? '',
      thirdName: json['third_name'] ?? '',
      lastName: json['last_name'] ?? '',
      firstName: json['first_name'] ?? '',
      birthDate: json['birthDate'] ?? '',
      phone: json['phone'] ?? '',
      jobDescription: json['job_description'] ?? '',
      policyIds: json['policy_ids'] != null
          ? (json['policy_ids'] as List)
                .map((item) => GenericModel.fromJson(item))
                .toList()
          : [],
      genderEnum: json['gender'] != null
          ? handleToGender(gender: json['gender'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'branch_ids': branchIds,
      'current_company_id': currentCompanyId,
      'company_ids': companyIds?.map((e) => e.toJson()).toList(),
      'email': email,
      'id': id?.map((e) => e.toJson()).toList(),
      'name': name,
      'first_name': firstName,
      'second_name': secondName,
      'third_name': thirdName,
      'last_name': lastName,
      'birthDate': birthDate,
      'phone': phone,
      'job_description': jobDescription,
      'policy_ids': policyIds?.map((e) => e.toJson()).toList(),
      'gender': genderEnum?.name,
    };
  }
}
