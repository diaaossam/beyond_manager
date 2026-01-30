class SickLeaveParams {
  final int? insuredMemberId;
  final String? name;
  final int policyId;

  SickLeaveParams(
      {required this.insuredMemberId,
        required this.name,
        required this.policyId});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    if (insuredMemberId != null) map['insured_member_id'] = insuredMemberId;
    map['policy_id'] = policyId;
    if (name != null) map['other_insured'] = name;
    return map;
  }
}
