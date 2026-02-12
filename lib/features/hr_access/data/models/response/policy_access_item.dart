class PolicyAccessItem {
  final num? policyId;
  final String? policyName;
  final bool accessPayment;
  final bool accessPolicyDetails;
  final bool accessUtilization;
  final bool accessActiveList;
  final bool accessAdditionAndDeletions;

  PolicyAccessItem({
    this.policyId,
    this.policyName,
    this.accessPayment = false,
    this.accessPolicyDetails = false,
    this.accessUtilization = false,
    this.accessActiveList = false,
    this.accessAdditionAndDeletions = false,
  });

  factory PolicyAccessItem.fromJson(Map<String, dynamic> json) {
    return PolicyAccessItem(
      policyId: json['policy_id'],
      policyName: json['policy_name'] as String?,
      accessPayment: json['access_payment'] == true,
      accessPolicyDetails: json['access_policy_details'] == true,
      accessUtilization: json['access_utilization'] == true,
      accessActiveList: json['access_active_list'] == true,
      accessAdditionAndDeletions: json['access_addition_and_deletions'] == true,
    );
  }

  PolicyAccessItem copyWith({
    num? policyId,
    String? policyName,
    bool? accessPayment,
    bool? accessPolicyDetails,
    bool? accessUtilization,
    bool? accessActiveList,
    bool? accessAdditionAndDeletions,
  }) {
    return PolicyAccessItem(
      policyId: policyId ?? this.policyId,
      policyName: policyName ?? this.policyName,
      accessPayment: accessPayment ?? this.accessPayment,
      accessPolicyDetails: accessPolicyDetails ?? this.accessPolicyDetails,
      accessUtilization: accessUtilization ?? this.accessUtilization,
      accessActiveList: accessActiveList ?? this.accessActiveList,
      accessAdditionAndDeletions:
          accessAdditionAndDeletions ?? this.accessAdditionAndDeletions,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'policy_id': policyId,
      'policy_name': policyName,
      'access_payment': accessPayment,
      'access_policy_details': accessPolicyDetails,
      'access_utilization': accessUtilization,
      'access_active_list': accessActiveList,
      'access_addition_and_deletions': accessAdditionAndDeletions,
    };
  }
}
