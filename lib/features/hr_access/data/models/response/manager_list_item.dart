class ManagerListItem {
  ManagerListItem({
    this.accessActiveList,
    this.accessAdditionAndDeletions,
    this.accessPayment,
    this.accessPolicyDetails,
    this.accessUtilization,
    this.companyIds,
    this.isBeyondUsers,
    this.leftTheCompany,
    this.managerId,
    this.name,
    this.phone,
    this.policyIds,
    this.policyLines,
    this.reimbursement,
  });

  ManagerListItem.fromJson(dynamic json) {
    accessActiveList = json['access_active_list'];
    accessAdditionAndDeletions = json['access_addition_and_deletions'];
      accessPayment = json['access_payment'];
    accessPolicyDetails = json['access_policy_details'];
    accessUtilization = json['access_utilization'];
    companyIds = json['company_ids'] != null
        ? json['company_ids'].cast<num>()
        : [];
    isBeyondUsers = json['is_beyond_users'];
    leftTheCompany = json['left_the_company'];
    managerId = json['manager_id'];
    name = json['name'];
    phone = json['phone'];
    policyIds = json['policy_ids'] != null
        ? json['policy_ids'].cast<num>()
        : [];
    if (json['policy_lines'] != null) {
      policyLines = [];
      json['policy_lines'].forEach((v) {
        policyLines?.add(PolicyLines.fromJson(v));
      });
    }
    reimbursement = json['reimbursement'];
  }

  bool? accessActiveList;
  bool? accessAdditionAndDeletions;
  bool? accessPayment;
  bool? accessPolicyDetails;
  bool? accessUtilization;
  List<num>? companyIds;
  bool? isBeyondUsers;
  bool? leftTheCompany;
  num? managerId;
  String? name;
  String? phone;
  List<num>? policyIds;
  List<PolicyLines>? policyLines;
  bool? reimbursement;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_active_list'] = accessActiveList;
    map['access_addition_and_deletions'] = accessAdditionAndDeletions;
    map['access_payment'] = accessPayment;
    map['access_policy_details'] = accessPolicyDetails;
    map['access_utilization'] = accessUtilization;
    map['company_ids'] = companyIds;
    map['is_beyond_users'] = isBeyondUsers;
    map['left_the_company'] = leftTheCompany;
    map['manager_id'] = managerId;
    map['name'] = name;
    map['phone'] = phone;
    map['policy_ids'] = policyIds;
    if (policyLines != null) {
      map['policy_lines'] = policyLines?.map((v) => v.toJson()).toList();
    }
    map['reimbursement'] = reimbursement;
    return map;
  }

  static List<ManagerListItem> fromJsonList(dynamic response) {
    return response['result']
        .map<ManagerListItem>((item) => ManagerListItem.fromJson(item))
        .toList();
  }
}

class PolicyLines {
  PolicyLines({
    this.accessActiveList,
    this.accessAdditionAndDeletions,
    this.accessPayment,
    this.accessPolicyDetails,
    this.accessUtilization,
    this.policyId,
  });

  PolicyLines.fromJson(dynamic json) {
    accessActiveList = json['access_active_list'];
    accessAdditionAndDeletions = json['access_addition_and_deletions'];
    accessPayment = json['access_payment'];
    accessPolicyDetails = json['access_policy_details'];
    accessUtilization = json['access_utilization'];
    policyId = json['policy_id'];
  }

  bool? accessActiveList;
  bool? accessAdditionAndDeletions;
  bool? accessPayment;
  bool? accessPolicyDetails;
  bool? accessUtilization;
  num? policyId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_active_list'] = accessActiveList;
    map['access_addition_and_deletions'] = accessAdditionAndDeletions;
    map['access_payment'] = accessPayment;
    map['access_policy_details'] = accessPolicyDetails;
    map['access_utilization'] = accessUtilization;
    map['policy_id'] = policyId;
    return map;
  }
}
