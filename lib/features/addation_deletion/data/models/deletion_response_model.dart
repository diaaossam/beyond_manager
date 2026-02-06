class DeletionResponseModel {
  DeletionResponseModel({
      this.result, 
      this.totalCount,});

  DeletionResponseModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(DeletionMemberModel.fromJson(v));
      });
    }
    totalCount = json['total_count'];
  }
  List<DeletionMemberModel>? result;
  num? totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    map['total_count'] = totalCount;
    return map;
  }

  /// Copy With

  DeletionResponseModel copyWith({
    List<DeletionMemberModel>? result,
    num? totalCount,
  }) {
    return DeletionResponseModel(
      result: result ?? this.result,
      totalCount: totalCount ?? this.totalCount,
    );
  }
}

class DeletionMemberModel {
  DeletionMemberModel({
      this.activeListDob, 
      this.address, 
      this.arInsuredMember, 
      this.branchId, 
      this.branchName, 
      this.email, 
      this.endDate, 
      this.gender, 
      this.hiringDate, 
      this.iban, 
      this.id, 
      this.insuranceId, 
      this.insuredMember, 
      this.maritalStatus, 
      this.memberStatus, 
      this.mobilenumber, 
      this.nationality, 
      this.nationalnumber, 
      this.planId, 
      this.policyId, 
      this.principalInsuranceId, 
      this.relation, 
      this.relationId, 
      this.salary, 
      this.staffid, 
      this.startDate,});

  DeletionMemberModel.fromJson(dynamic json) {
    activeListDob = json['active_list_dob'];
    address = json['address'];
    arInsuredMember = json['ar_insured_member'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    email = json['email'];
    endDate = json['end_date'];
    gender = json['gender'];
    hiringDate = json['hiring_date'];
    iban = json['iban'];
    id = json['id'];
    insuranceId = json['insurance_id'];
    insuredMember = json['insured_member'];
    maritalStatus = json['marital_status'];
    memberStatus = json['member_status'];
    mobilenumber = json['mobilenumber'];
    nationality = json['nationality'];
    nationalnumber = json['nationalnumber'];
    planId = json['plan_id'];
    policyId = json['policy_id'];
    principalInsuranceId = json['principal_insurance_id'];
    relation = json['relation'];
    relationId = json['relation_id'];
    salary = json['salary'];
    staffid = json['staffid'];
    startDate = json['start_date'];
  }
  String? activeListDob;
  dynamic address;
  dynamic arInsuredMember;
  num? branchId;
  String? branchName;
  dynamic email;
  dynamic endDate;
  String? gender;
  dynamic hiringDate;
  dynamic iban;
  num? id;
  dynamic insuranceId;
  String? insuredMember;
  String? maritalStatus;
  String? memberStatus;
  dynamic mobilenumber;
  dynamic nationality;
  String? nationalnumber;
  String? planId;
  num? policyId;
  dynamic principalInsuranceId;
  String? relation;
  num? relationId;
  dynamic salary;
  String? staffid;
  String? startDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['active_list_dob'] = activeListDob;
    map['address'] = address;
    map['ar_insured_member'] = arInsuredMember;
    map['branch_id'] = branchId;
    map['branch_name'] = branchName;
    map['email'] = email;
    map['end_date'] = endDate;
    map['gender'] = gender;
    map['hiring_date'] = hiringDate;
    map['iban'] = iban;
    map['id'] = id;
    map['insurance_id'] = insuranceId;
    map['insured_member'] = insuredMember;
    map['marital_status'] = maritalStatus;
    map['member_status'] = memberStatus;
    map['mobilenumber'] = mobilenumber;
    map['nationality'] = nationality;
    map['nationalnumber'] = nationalnumber;
    map['plan_id'] = planId;
    map['policy_id'] = policyId;
    map['principal_insurance_id'] = principalInsuranceId;
    map['relation'] = relation;
    map['relation_id'] = relationId;
    map['salary'] = salary;
    map['staffid'] = staffid;
    map['start_date'] = startDate;
    return map;
  }

}