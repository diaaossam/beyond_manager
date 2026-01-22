class UtilizationModel {
  UtilizationModel({
    this.dashboardLink,
    this.isMedical,
    this.lastUpdatedDate,
    this.result,
    this.totalCount,
    this.totalPages,
  });

  UtilizationModel.fromJson(dynamic json) {
    dashboardLink = json['Dashboard Link'];
    isMedical = json['Is Medical'];
    lastUpdatedDate = json['Last Updated Date'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Utilization.fromJson(v));
      });
    }
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
  }

  dynamic dashboardLink;
  bool? isMedical;
  String? lastUpdatedDate;
  List<Utilization>? result;
  num? totalCount;
  num? totalPages;

  UtilizationModel copyWith({
    dynamic dashboardLink,
    bool? isMedical,
    String? lastUpdatedDate,
    List<Utilization>? result,
    num? totalCount,
    num? totalPages,
  }) => UtilizationModel(
    dashboardLink: dashboardLink ?? this.dashboardLink,
    isMedical: isMedical ?? this.isMedical,
    lastUpdatedDate: lastUpdatedDate ?? this.lastUpdatedDate,
    result: result ?? this.result,
    totalCount: totalCount ?? this.totalCount,
    totalPages: totalPages ?? this.totalPages,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Dashboard Link'] = dashboardLink;
    map['Is Medical'] = isMedical;
    map['Last Updated Date'] = lastUpdatedDate;
    if (result != null) {
    //  map['result'] = result?.map((v) => v.toJson()).toList();
    }
    map['total_count'] = totalCount;
    map['total_pages'] = totalPages;
    return map;
  }
}

class Utilization {
  Utilization(
      {this.account,
        this.age,
        this.branch,
        this.chronic,
        this.claimDate,
        this.claimID,
        this.disease,
        this.diseaseCategory,
        this.gender,
        this.iCDCode,
        this.insuredMember,
        this.memberID,
        this.memberName,
        this.month,
        this.provider,
        this.relation,
        this.riskCarrier,
        this.servicesGroup,
        this.tpa,
        this.totalAmount,
        this.name,
        this.value,
        this.staffId,
        this.policyNumber});

  Utilization.fromJson(dynamic json) {
    account = json['Account'];
    age = json['Age'];
    staffId = json['Staff Id'];
    branch = json['Branch'];
    chronic = json['Chronic'];
    claimDate = json['Claim Date'];
    claimID = json['Claim ID'];
    disease = json['Disease'];
    diseaseCategory = json['Disease Category'];
    gender = json['Gender'];
    iCDCode = json['ICD Code'];
    insuredMember = json['Insured Member'];
    memberID = json['Member ID'];
    memberName = json['Member Name'];
    month = json['Month'];
    provider = json['Provider'];
    relation = json['Relation'];
    riskCarrier = json['Risk Carrier'];
    servicesGroup = json['Services Group'];
    tpa = json['TPA'];
    totalAmount = json['Total Amount'];
    policyNumber = json['Policy Number'];
    name = json['Name'];
    value = json['Value'];
  }

  String? account;
  String? staffId;
  num? age;
  dynamic branch;
  String? chronic;
  String? claimDate;
  String? claimID;
  String? disease;
  String? diseaseCategory;
  String? gender;
  String? iCDCode;
  String? insuredMember;
  String? memberID;
  String? memberName;
  String? month;
  String? provider;
  String? relation;
  String? policyNumber;
  String? riskCarrier;
  String? servicesGroup;
  String? name;
  String? value;
  String? tpa;
  num? totalAmount;
}
