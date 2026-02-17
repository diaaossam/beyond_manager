import 'package:bond/features/addation_deletion/data/models/response/policies_data_addation.dart';
import 'package:bond/features/addation_deletion/data/models/response/relationship_model.dart';
import '../../../../../core/enum/gender.dart';
import '../enums/marital_status_enum.dart';
import '../enums/nationality_enum.dart';

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
  String? salary;
  String? iban;
  String? address;
  String? photoFileName;
  String? acknowledgmentFileName;
  String? staffNumber;
  String? memberStatus;
  List<PoliciesDataModel>? policies;
  List<Map<String, dynamic>>? policyData;

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
    this.salary,
    this.iban,
    this.address,
    this.photoFileName,
    this.staffNumber,
    this.memberStatus,
    this.policies,
    this.policyData,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'insured_member': fullNameEnglish,
      'ar_insured_member': fullNameArabic,
      'member_status': memberStatus ?? "under_addition",
      'staffid': staffNumber,
      'nationalnumber': nationalId,
      'mobilenumber': phoneNumber,
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
    };
    if (policyData != null && policyData!.isNotEmpty) {
      map['policy_data'] = policyData;
    }
    map.removeWhere((key, value) => value == null || value.toString().isEmpty);
    return map;
  }
}
