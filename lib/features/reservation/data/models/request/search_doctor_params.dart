class SearchDoctorParams {
  final int? hospitalId;
  final int? branchId;
  final int? specialityId;
  final String? date;
  final int? policyId;

  SearchDoctorParams({
    this.hospitalId,
    this.branchId,
    this.specialityId,
    this.date,
    this.policyId,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (hospitalId != null) map['hospital_id'] = hospitalId;
    if (branchId != null) map['branch_id'] = branchId;
    if (specialityId != null) map['speciality_id'] = specialityId;
    if (date != null) map['date'] = date;
    if (policyId != null) map['policy_id'] = policyId;
    return map;
  }
}
