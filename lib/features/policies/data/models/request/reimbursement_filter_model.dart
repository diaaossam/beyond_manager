class ReimbursementFilterModel {
  final int pageKey;
  final int? pageSize;
  final int policyId;
  final String? name; // member_name
  final String? insuranceId; // member_id
  final String? staffId;
  final String? policyNumber;
  final String? searchQuery;
  final String? claimStatus;
  final String? serviceType;
  final DateTime? serviceDateFrom;
  final DateTime? serviceDateTo;
  final bool? isLifeClaim;
  final String? sortBy; // newest or oldest

  // API authentication parameters
  final String? clientKey;
  final String? clientSecret;
  final int? userManagerId;

  ReimbursementFilterModel({
    this.pageKey = 1,
    this.pageSize = 100,
    required this.policyId,
    this.name,
    this.insuranceId,
    this.staffId,
    this.policyNumber,
    this.searchQuery,
    this.claimStatus,
    this.serviceType,
    this.serviceDateFrom,
    this.serviceDateTo,
    this.isLifeClaim,
    this.sortBy = 'oldest',
    this.clientKey,
    this.clientSecret,
    this.userManagerId,
  });

  ReimbursementFilterModel copyWith({
    int? pageKey,
    int? pageSize,
    int? policyId,
    String? name,
    String? insuranceId,
    String? staffId,
    String? policyNumber,
    String? searchQuery,
    String? claimStatus,
    String? serviceType,
    DateTime? serviceDateFrom,
    DateTime? serviceDateTo,
    bool? isLifeClaim,
    String? sortBy,
    String? clientKey,
    String? clientSecret,
    int? userManagerId,
  }) {
    return ReimbursementFilterModel(
      pageKey: pageKey ?? this.pageKey,
      pageSize: pageSize ?? this.pageSize,
      policyId: policyId ?? this.policyId,
      name: name ?? this.name,
      insuranceId: insuranceId ?? this.insuranceId,
      staffId: staffId ?? this.staffId,
      policyNumber: policyNumber ?? this.policyNumber,
      searchQuery: searchQuery ?? this.searchQuery,
      claimStatus: claimStatus ?? this.claimStatus,
      serviceType: serviceType ?? this.serviceType,
      serviceDateFrom: serviceDateFrom ?? this.serviceDateFrom,
      serviceDateTo: serviceDateTo ?? this.serviceDateTo,
      isLifeClaim: isLifeClaim ?? this.isLifeClaim,
      sortBy: sortBy ?? this.sortBy,
      clientKey: clientKey ?? this.clientKey,
      clientSecret: clientSecret ?? this.clientSecret,
      userManagerId: userManagerId ?? this.userManagerId,
    );
  }

  /// Convert model to query parameters matching the API format
  Map<String, dynamic> toQueryParams() {
    return {
      "client_key": clientKey,
      "client_secret": clientSecret,
      "user_manager_id": userManagerId,
      "policy_id": policyId,
      "page_size": pageSize,
      "page_number": pageKey,
      "member_name": name,
      "member_id": insuranceId,
      "staff_id": staffId,
      "claim_status": claimStatus,
      "service_type": serviceType,
      "service_date_from": serviceDateFrom?.toIso8601String().split("T").first,
      "service_date_to": serviceDateTo?.toIso8601String().split("T").first,
      "sort_order": sortBy,
      if(isLifeClaim!= null)"is_life_claim": isLifeClaim == true ? "yes" : "no",
    }..removeWhere((key, value) => value == null);
  }
}
