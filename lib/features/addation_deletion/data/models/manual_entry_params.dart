import 'dart:convert';
import 'dart:io';

import 'package:bond/features/addation_deletion/data/models/relationship_model.dart';

import '../../../../core/enum/gender.dart';
import '../../../policies/data/models/response/main_policy_model.dart';
import 'enums/insurance_plan_enum.dart';
import 'enums/marital_status_enum.dart';
import 'enums/nationality_enum.dart';

class MemberFormData {
  RelationshipModel? relationship;
  String? fullNameArabic;
  String? fullNameEnglish;
  NationalityEnum? nationality;
  String? nationalId;
  String? dateOfBirth;
  String? hiringDate;
  String? additionDate;
  MaritalStatusEnum? maritalStatus;
  GenderEnum? gender;
  String? phoneNumber;
  String? emailAddress;
  InsurancePlanEnum? medicalInsurancePlan;
  String? salary;
  String? iban;
  String? address;
  String? photoFileName;
  String? acknowledgmentFileName;
  String? staffNumber;
  String? memberStatus;
   List<MainPolicyModel> ? policies;

  MemberFormData({
    this.relationship,
    this.fullNameArabic,
    this.fullNameEnglish,
    this.nationality,
    this.nationalId,
    this.dateOfBirth,
    this.hiringDate,
    this.additionDate,
    this.maritalStatus,
    this.gender,
    this.phoneNumber,
    this.emailAddress,
    this.medicalInsurancePlan,
    this.salary,
    this.iban,
    this.address,
    this.photoFileName,
    this.acknowledgmentFileName,
    this.staffNumber,
    this.memberStatus,
    this.policies,
  });

  Future<Map<String, dynamic>> toJson() async {
    String? photoBase64;
    String? acknowledgmentBase64;

    if (photoFileName != null && photoFileName!.isNotEmpty) {
      final file = File(photoFileName!);
      if (await file.exists()) {
        final bytes = await file.readAsBytes();
        photoBase64 = base64Encode(bytes);
      }
    }

    if (acknowledgmentFileName != null && acknowledgmentFileName!.isNotEmpty) {
      final file = File(acknowledgmentFileName!);
      if (await file.exists()) {
        final bytes = await file.readAsBytes();
        acknowledgmentBase64 = base64Encode(bytes);
      }
    }

    Map<String, dynamic> map = {
      'insured_member': fullNameEnglish,
      'ar_insured_member': fullNameArabic,
      'member_status': memberStatus ?? "under_addition",
      'staffid': staffNumber,
      'nationalnumber': nationalId,
      'mobilenumber': phoneNumber,
      "plan_id": medicalInsurancePlan?.name,
      "gender": gender == GenderEnum.male ? "male" : "female",
      "marital_status": maritalStatus?.name,
      'relation2_id': relationship?.id,
      'nationality': nationality?.name,
      'active_list_dob': dateOfBirth,
      'hiring_date': hiringDate,
      'addition_date': additionDate,
      'email': emailAddress,
      'salary': salary,
      'iban': iban,
      'address': address,
      "member_photo": photoBase64,
      "acknowledgment_statement": acknowledgmentBase64,
    };
    map.removeWhere((key, value) => value == null || value.toString().isEmpty);
    return map;
  }
}
