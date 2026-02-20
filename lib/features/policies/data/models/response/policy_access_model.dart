class PolicyAccessModel {
  PolicyAccessModel({
    this.accessActiveList,
    this.accessPayments,
    this.accessPolicyDetails,
    this.accessUtilization,
    this.companyId,
    this.policyId,
    this.accessAdditionAndDeletions,
    this.accessSickLeave
  });

  PolicyAccessModel.fromJson(dynamic json) {
    accessActiveList = json['access_active_list'];
    accessPayments = json['access_payments'];
    accessPolicyDetails = json['access_policy_details'];
    accessUtilization = json['access_utilization'];
    companyId = json['company_id'];
    policyId = json['policy_id'];
    accessAdditionAndDeletions = json['access_addition_and_deletions'];
    accessSickLeave = json['access_sick_leave'];
  }

  bool? accessActiveList;
  bool? accessPayments;
  bool? accessPolicyDetails;
  bool? accessUtilization;
  bool? accessAdditionAndDeletions;
  bool? accessSickLeave;
  num? companyId;
  num? policyId;

}
