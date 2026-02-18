class DeletionResponseModel {
  DeletionResponseModel({
    this.result,
    this.totalCount,
    this.totalPages,
    this.msg,
  });

  DeletionResponseModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(DeletionMemberModel.fromJson(v));
      });
    }
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
  }

  List<DeletionMemberModel>? result;
  num? totalCount;
  num? totalPages;
  String? msg;

  DeletionResponseModel copyWith({
    List<DeletionMemberModel>? result,
    num? totalCount,
    num? totalPages,
    String? msg,
  }) => DeletionResponseModel(
    result: result ?? this.result,
    totalCount: totalCount ?? this.totalCount,
    msg: msg ?? this.msg,
    totalPages: totalPages ?? this.totalPages,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    map['total_count'] = totalCount;
    map['total_pages'] = totalPages;
    return map;
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
    this.startDate,
  });

  DeletionMemberModel.fromJson(dynamic json) {
    activeListDob = json['active_list_dob'].toString();
    address = json['address'].toString();
    arInsuredMember = json['ar_insured_member'].toString();
    branchId = json['branch_id'].toString();
    branchName = json['branch_name'].toString();
    email = json['email'].toString();
    endDate = json['end_date'].toString();
    gender = json['gender'].toString();
    hiringDate = json['hiring_date'].toString();
    iban = json['iban'].toString();
    id = json['id'] is num ? json['id'] : num.parse(json['id'].toString());
    insuranceId = json['insurance_id'].toString();
    insuredMember = json['insured_member'].toString();
    maritalStatus = json['marital_status'].toString();
    memberStatus = json['member_status'].toString();
    mobilenumber = json['mobilenumber'].toString();
    nationality = json['nationality'].toString();
    nationalnumber = json['nationalnumber'].toString();
    planId = json['plan_id'].toString();
    policyId = json['policy_id'].toString();
    principalInsuranceId = json['principal_insurance_id'].toString();
    relation = json['relation'].toString();
    relationId = json['relation_id'].toString();
    salary = json['salary'].toString();
    staffid = json['staffid'].toString();
    startDate = json['start_date'].toString();
  }

  String? activeListDob;
  String? address;
  String? arInsuredMember;
  String? branchId;
  String? branchName;
  String? email;
  String? endDate;
  String? gender;
  String? hiringDate;
  String? iban;
  num? id;
  String? insuranceId;
  String? insuredMember;
  String? maritalStatus;
  String? memberStatus;
  String? mobilenumber;
  String? nationality;
  String? nationalnumber;
  String? planId;
  String? policyId;
  String? principalInsuranceId;
  String? relation;
  String? relationId;
  String? salary;
  String? staffid;
  String? startDate;

  DeletionMemberModel copyWith({
    String? activeListDob,
    String? address,
    String? arInsuredMember,
    String? branchId,
    String? branchName,
    String? email,
    String? endDate,
    String? gender,
    String? hiringDate,
    String? iban,
    num? id,
    String? insuranceId,
    String? insuredMember,
    String? maritalStatus,
    String? memberStatus,
    String? mobilenumber,
    String? nationality,
    String? nationalnumber,
    String? planId,
    String? policyId,
    String? principalInsuranceId,
    String? relation,
    String? relationId,
    String? salary,
    String? staffid,
    String? startDate,
  }) => DeletionMemberModel(
    activeListDob: activeListDob ?? this.activeListDob,
    address: address ?? this.address,
    arInsuredMember: arInsuredMember ?? this.arInsuredMember,
    branchId: branchId ?? this.branchId,
    branchName: branchName ?? this.branchName,
    email: email ?? this.email,
    endDate: endDate ?? this.endDate,
    gender: gender ?? this.gender,
    hiringDate: hiringDate ?? this.hiringDate,
    iban: iban ?? this.iban,
    id: id ?? this.id,
    insuranceId: insuranceId ?? this.insuranceId,
    insuredMember: insuredMember ?? this.insuredMember,
    maritalStatus: maritalStatus ?? this.maritalStatus,
    memberStatus: memberStatus ?? this.memberStatus,
    mobilenumber: mobilenumber ?? this.mobilenumber,
    nationality: nationality ?? this.nationality,
    nationalnumber: nationalnumber ?? this.nationalnumber,
    planId: planId ?? this.planId,
    policyId: policyId ?? this.policyId,
    principalInsuranceId: principalInsuranceId ?? this.principalInsuranceId,
    relation: relation ?? this.relation,
    relationId: relationId ?? this.relationId,
    salary: salary ?? this.salary,
    staffid: staffid ?? this.staffid,
    startDate: startDate ?? this.startDate,
  );

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
