import 'package:bond/features/policies/data/models/active_list_statics_model.dart';

class ActiveListPolicyModel {
  ActiveListPolicyModel(
      {this.isMedical,
      this.isisBusinessLife,
      this.lastUpdatedDate,
      this.result,
      this.totalCount,
      this.totalPages,
      this.activeListStaticsModel});

  ActiveListPolicyModel.fromJson(dynamic json) {
    isMedical = json['Is Medical'];
    isisBusinessLife = json['Is Life'];
    lastUpdatedDate = json['Last Updated Date'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(ActiveListResult.fromJson(v));
      });
    }
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
    activeListStaticsModel = json['statistics'] != null
        ? ActiveListStaticsModel.fromJson(json['statistics'])
        : null;
  }

  bool? isMedical;
  bool? isisBusinessLife;
  String? lastUpdatedDate;
  List<ActiveListResult>? result;
  num? totalCount;
  num? totalPages;
  ActiveListStaticsModel? activeListStaticsModel;
}

class ActiveListResult {
  ActiveListResult(
      {this.bankAccount,
      this.beyondDeletionDate,
      this.branch,
      this.category,
      this.dateOfBirth,
      this.deletionDate,
      this.endDate,
      this.insuranceCardName,
      this.member,
      this.plan,
      this.principleInsuranceId,
      this.relation,
      this.staff,
      this.startDate,
      this.memberId,
      this.isDeleted,
      this.uploadType,
      this.insuranceID,
      this.reactivationDate,
      this.value,
      this.name,
      this.policyNumber});

  ActiveListResult.fromJson(dynamic json) {
    bankAccount = json['Bank Account'];
    beyondDeletionDate = json['Beyond Deletion Date'];
    branch = json['Branch'];
    category = json['Category'];
    dateOfBirth = json['Date Of Birth'];
    deletionDate = json['Deletion Date'];
    endDate = json['End Date'];
    insuranceCardName = json['Insurance Card Name'];
    member = json['Member'];
    plan = json['Plan'];
    principleInsuranceId = json['Principle Insurance Id'];
    relation = json['Relation'];
    staff = json['Staff'];
    startDate = json['Start Date'];
    uploadType = json['Upload Type'];
    insuranceID = json['insurance ID'];
    isDeleted = json['Is Deleted'];
    memberStatus = json['Member Status']?.toString();
    policyNumber = json['Policy Number'];
    reactivationDate = json['Reactivation Date'];
    name = json['Name'];
    value = json['Value'];
    memberId = json['Member ID'];
  }

  String? bankAccount;
  String? beyondDeletionDate;
  dynamic branch;
  String? category;
  String? dateOfBirth;
  String? deletionDate;
  String? endDate;
  String? insuranceCardName;
  String? member;
  int? memberId;
  String? plan;
  String? principleInsuranceId;
  String? relation;
  String? memberStatus;
  String? staff;
  String? startDate;
  String? uploadType;
  String? insuranceID;
  String? policyNumber;
  String? reactivationDate;
  String? name;
  String? value;
  String? isDeleted;
}
