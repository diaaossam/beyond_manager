import '../../../../core/enum/gender.dart';
import 'enums/insurance_plan_enum.dart';
import 'enums/marital_status_enum.dart';
import 'enums/nationality_enum.dart';
import 'enums/relationship_enum.dart';

class MemberFormData {
  RelationshipEnum? relationship;
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
  InsurancePlanEnum? lifeInsurancePlan;
  InsurancePlanEnum? dentalInsurancePlan;
  InsurancePlanEnum? visionCarePlan;
  String? salary;
  String? iban;
  String? address;
  String? photoFileName;
  String? acknowledgmentFileName;
  String? staffNumber;
}
