class ActiveListParams {
  final int pageKey;
  final int? pageSize;
  final int policyId;
  final String? name;
  final String? memberName;
  final String? insuranceId;
  final String? staffId;
  final String? policyNumber;
  final String? member;
  final String? activeListPolicyNumber;
  final String? memberStatus;
  final String? subStatus;

  final String? dateFrom;
  final String? dateTo;

  final String? startDateFrom;
  final String? startDateTo;
  final String? reactivationDateFrom;
  final String? reactivationDateTo;
  final String? endDateFrom;
  final String? endDateTo;
  final String? deletionDateFrom;
  final String? deletionDateTo;
  final String? dobFrom;
  final String? dobTo;

  final int? startDateYear;
  final int? startDateMonth;
  final int? reactivationDateYear;
  final int? reactivationDateMonth;
  final int? endDateYear;
  final int? endDateMonth;
  final int? deletionDateYear;
  final int? deletionDateMonth;
  final int? dobYear;
  final int? dobMonth;
  final List<num>? polices;

  ActiveListParams({
    this.pageKey = 1,
    required this.policyId,
    this.name,
    this.pageSize,
    this.policyNumber,
    this.memberName,
    this.staffId,
    this.insuranceId,
    this.member,
    this.activeListPolicyNumber,
    this.memberStatus,
    this.subStatus,
    this.dateFrom,
    this.dateTo,
    this.startDateFrom,
    this.startDateTo,
    this.reactivationDateFrom,
    this.reactivationDateTo,
    this.endDateFrom,
    this.endDateTo,
    this.deletionDateFrom,
    this.deletionDateTo,
    this.dobFrom,
    this.dobTo,
    this.startDateYear,
    this.startDateMonth,
    this.reactivationDateYear,
    this.reactivationDateMonth,
    this.endDateYear,
    this.endDateMonth,
    this.deletionDateYear,
    this.deletionDateMonth,
    this.dobYear,
    this.dobMonth,
    this.polices,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "policy_id": policyId,
      "page_number": pageKey,
      "page_size": pageSize,
      "member": name,
      "insurance_id": insuranceId,
      if (memberName != null && memberName!.isNotEmpty) "name": memberName,
      "staff_id": staffId,
      "policy_number": policyNumber,
      "active_list_policy_number": activeListPolicyNumber,
      "member_status": memberStatus,
      "sub_status": subStatus,
      "date_from": dateFrom,
      "date_to": dateTo,
      "start_date_from": startDateFrom,
      "start_date_to": startDateTo,
      "reactivation_date_from": reactivationDateFrom,
      "reactivation_date_to": reactivationDateTo,
      "end_date_from": endDateFrom,
      "end_date_to": endDateTo,
      "deletion_date_from": deletionDateFrom,
      "deletion_date_to": deletionDateTo,
      "dob_from": dobFrom,
      "dob_to": dobTo,
      "start_date_year": startDateYear,
      "start_date_month": startDateMonth,
      "reactivation_date_year": reactivationDateYear,
      "reactivation_date_month": reactivationDateMonth,
      "end_date_year": endDateYear,
      "end_date_month": endDateMonth,
      "deletion_date_year": deletionDateYear,
      "deletion_date_month": deletionDateMonth,
      "dob_year": dobYear,
      "dob_month": dobMonth,
    };
    map.removeWhere(
      (key, value) =>
          value == null ||
          value.toString().isEmpty ||
          value.toString() == "null",
    );
    return map;
  }

  ActiveListParams copyWith({
    int? pageKey,
    int? policyId,
    String? name,
    String? memberName,
    String? insuranceId,
    String? staffId,
    String? policyNumber,
    int? pageSize,
    String? member,
    String? activeListPolicyNumber,
    String? memberStatus,
    String? subStatus,
    String? dateFrom,
    String? dateTo,
    String? startDateFrom,
    String? startDateTo,
    String? reactivationDateFrom,
    String? reactivationDateTo,
    String? endDateFrom,
    String? endDateTo,
    String? deletionDateFrom,
    String? deletionDateTo,
    String? dobFrom,
    String? dobTo,
    int? startDateYear,
    int? startDateMonth,
    int? reactivationDateYear,
    int? reactivationDateMonth,
    int? endDateYear,
    int? endDateMonth,
    int? deletionDateYear,
    int? deletionDateMonth,
    int? dobYear,
    int? dobMonth,
  }) {
    return ActiveListParams(
      pageSize: pageSize ?? this.pageSize,
      pageKey: pageKey ?? this.pageKey,
      memberName: memberName ?? this.memberName,
      policyId: policyId ?? this.policyId,
      name: name ?? this.name,
      insuranceId: insuranceId ?? this.insuranceId,
      policyNumber: policyNumber ?? this.policyNumber,
      staffId: staffId ?? this.staffId,
      member: member ?? this.member,
      activeListPolicyNumber:
          activeListPolicyNumber ?? this.activeListPolicyNumber,
      memberStatus: (memberStatus != null && memberStatus.isEmpty)
          ? null
          : memberStatus ?? this.memberStatus,
      subStatus: (subStatus != null && subStatus.isEmpty)
          ? null
          : subStatus ?? this.subStatus,
      dateFrom: (dateFrom != null && dateFrom.isEmpty)
          ? null
          : dateFrom ?? this.dateFrom,
      dateTo: (dateTo != null && dateTo.isEmpty) ? null : dateTo ?? this.dateTo,
      startDateFrom: (startDateFrom != null && startDateFrom.isEmpty)
          ? null
          : startDateFrom ?? this.startDateFrom,
      startDateTo: (startDateTo != null && startDateTo.isEmpty)
          ? null
          : startDateTo ?? this.startDateTo,
      reactivationDateFrom:
          (reactivationDateFrom != null && reactivationDateFrom.isEmpty)
          ? null
          : reactivationDateFrom ?? this.reactivationDateFrom,
      reactivationDateTo:
          (reactivationDateTo != null && reactivationDateTo.isEmpty)
          ? null
          : reactivationDateTo ?? this.reactivationDateTo,
      endDateFrom: (endDateFrom != null && endDateFrom.isEmpty)
          ? null
          : endDateFrom ?? this.endDateFrom,
      endDateTo: (endDateTo != null && endDateTo.isEmpty)
          ? null
          : endDateTo ?? this.endDateTo,
      deletionDateFrom: (deletionDateFrom != null && deletionDateFrom.isEmpty)
          ? null
          : deletionDateFrom ?? this.deletionDateFrom,
      deletionDateTo: (deletionDateTo != null && deletionDateTo.isEmpty)
          ? null
          : deletionDateTo ?? this.deletionDateTo,
      dobFrom: (dobFrom != null && dobFrom.isEmpty)
          ? null
          : dobFrom ?? this.dobFrom,
      dobTo: (dobTo != null && dobTo.isEmpty) ? null : dobTo ?? this.dobTo,
      startDateYear: startDateYear ?? this.startDateYear,
      startDateMonth: startDateMonth ?? this.startDateMonth,
      reactivationDateYear: reactivationDateYear ?? this.reactivationDateYear,
      reactivationDateMonth:
          reactivationDateMonth ?? this.reactivationDateMonth,
      endDateYear: endDateYear ?? this.endDateYear,
      endDateMonth: endDateMonth ?? this.endDateMonth,
      deletionDateYear: deletionDateYear ?? this.deletionDateYear,
      deletionDateMonth: deletionDateMonth ?? this.deletionDateMonth,
      dobYear: dobYear ?? this.dobYear,
      dobMonth: dobMonth ?? this.dobMonth,
    );
  }
}
