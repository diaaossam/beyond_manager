class MainPolicyModel {
  MainPolicyModel(
      {this.policyId,
      this.policyNumber,
      this.policyState,
      this.lineOfBusiness,
      this.policy_end_date,
      this.policy_start_date});

  MainPolicyModel.fromJson(dynamic json) {
    policyId = json['policy_id'];
    policyNumber = json['policy_number'];
    policyState = json['policy_state'];
    lineOfBusiness = json['line_of_business'] ?? "";
    policy_start_date = json['policy_start_date'];
    policy_end_date = json['policy_end_date'];
  }

  num? policyId;
  String? policyNumber;
  String? policyState;
  String? lineOfBusiness;
  String? policy_start_date;
  String? policy_end_date;
}
