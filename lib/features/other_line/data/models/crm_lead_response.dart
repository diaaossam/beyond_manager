class CrmLeadResponse {
  CrmLeadResponse({
    this.companyName,
    this.insuranceLineName,
    this.leadId,
    this.leadName,
    this.leadRef,
    this.matchLevelDisplay,
    this.message,
  });

  CrmLeadResponse.fromJson(dynamic json) {
    companyName = json['company_name'];
    insuranceLineName = json['insurance_line_name'];
    leadId = json['lead_id'];
    leadName = json['lead_name'];
    leadRef = json['lead_ref'];
    matchLevelDisplay = json['match_level_display'];
    message = json['message'];
  }

  String? companyName;
  String? insuranceLineName;
  num? leadId;
  String? leadName;
  String? leadRef;
  String? matchLevelDisplay;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_name'] = companyName;
    map['insurance_line_name'] = insuranceLineName;
    map['lead_id'] = leadId;
    map['lead_name'] = leadName;
    map['lead_ref'] = leadRef;
    map['match_level_display'] = matchLevelDisplay;
    map['message'] = message;
    return map;
  }
}
