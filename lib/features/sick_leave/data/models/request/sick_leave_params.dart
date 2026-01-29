class SickLeaveParams {
  final int policyId;
  final int? insuredMemberId;
  final String? diagnosis;
  final String? diagnosisCode;
  final int? numberOfDays;
  final String? dateOfInjury;
  final String? returnDate;
  final String? other;

  SickLeaveParams({
    required this.policyId,
    this.insuredMemberId,
    this.diagnosis,
    this.diagnosisCode,
    this.numberOfDays,
    this.dateOfInjury,
    this.returnDate,
    this.other,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['policy_id'] = policyId;
    if (insuredMemberId != null) map['insurance_id'] = insuredMemberId;
    if (diagnosis != null) map['diagnosis'] = diagnosis;
    if (diagnosisCode != null) map['diagnosis_code'] = diagnosisCode;
    if (numberOfDays != null) map['number_of_days'] = numberOfDays;
    if (dateOfInjury != null) map['date_of_injury'] = dateOfInjury;
    if (returnDate != null) map['return_date'] = returnDate;
    if (other != null) map['other'] = other;
    return map;
  }

  SickLeaveParams copyWith({
    int? policyId,
    int? insuredMemberId,
    String? diagnosis,
    String? diagnosisCode,
    int? numberOfDays,
    String? dateOfInjury,
    String? returnDate,
    String? other,
  }) {
    return SickLeaveParams(
      policyId: policyId ?? this.policyId,
      insuredMemberId: insuredMemberId ?? this.insuredMemberId,
      diagnosis: diagnosis ?? this.diagnosis,
      diagnosisCode: diagnosisCode ?? this.diagnosisCode,
      numberOfDays: numberOfDays ?? this.numberOfDays,
      dateOfInjury: dateOfInjury ?? this.dateOfInjury,
      returnDate: returnDate ?? this.returnDate,
      other: other ?? this.other,
    );
  }
}
