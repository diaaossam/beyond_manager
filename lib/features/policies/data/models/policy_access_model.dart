class PolicyAccessModel {
  PolicyAccessModel({
      this.accessActiveList, 
      this.accessPayments, 
      this.accessPolicyDetails, 
      this.accessUtilization, 
      this.companyId, 
      this.policyId,});

  PolicyAccessModel.fromJson(dynamic json) {
    accessActiveList = json['access_active_list'];
    accessPayments = json['access_payments'];
    accessPolicyDetails = json['access_policy_details'];
    accessUtilization = json['access_utilization'];
    companyId = json['company_id'];
    policyId = json['policy_id'];
  }
  bool? accessActiveList;
  bool? accessPayments;
  bool? accessPolicyDetails;
  bool? accessUtilization;
  num? companyId;
  num? policyId;
PolicyAccessModel copyWith({  bool? accessActiveList,
  bool? accessPayments,
  bool? accessPolicyDetails,
  bool? accessUtilization,
  num? companyId,
  num? policyId,
}) => PolicyAccessModel(  accessActiveList: accessActiveList ?? this.accessActiveList,
  accessPayments: accessPayments ?? this.accessPayments,
  accessPolicyDetails: accessPolicyDetails ?? this.accessPolicyDetails,
  accessUtilization: accessUtilization ?? this.accessUtilization,
  companyId: companyId ?? this.companyId,
  policyId: policyId ?? this.policyId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_active_list'] = accessActiveList;
    map['access_payments'] = accessPayments;
    map['access_policy_details'] = accessPolicyDetails;
    map['access_utilization'] = accessUtilization;
    map['company_id'] = companyId;
    map['policy_id'] = policyId;
    return map;
  }

}