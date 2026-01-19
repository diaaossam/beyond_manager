class PolicyDetails {
  PolicyDetails({
    this.beyondAccountManager,
    this.beyondPolicyNumber,
    this.beyondSalesAgent,
    this.endDate,
    this.insuranceCompany,
    this.insurancePlanType,
    this.insurancePolicyNumber,
    this.issuingType,
    this.lineOfBusiness,
    this.nextPayment,
    this.nextPaymentDate,
    this.paymentPlan,
    this.policyFileName,
    this.policyFileURL,
    this.startDate,
    this.state,
    this.branchesList,
    this.tpa,
    this.totalPaid,
    this.payments,
  });

  PolicyDetails.fromJson(dynamic json) {
    List<String> branches = [];
    if(json['Branches Names'] != null){
      json['Branches Names'].forEach((element){
        branches.add(element);
      });
    }

    beyondAccountManager = json['Beyond Account Manager'];
    beyondPolicyNumber = json['Beyond Policy Number'];
    beyondSalesAgent = json['Beyond Sales Agent'];
    endDate = json['End Date'];
    branchesList =branches;
    insuranceCompany = json['Insurance Company'];
    insurancePlanType = json['Insurance Plan Type'];
    insurancePolicyNumber = json['Insurance Policy Number'];
    issuingType = json['Issuing Type'];
    lineOfBusiness = json['Line Of Business'];
    nextPayment = json['Next Payment'];
    nextPaymentDate = json['Next Payment Date'];
    paymentPlan = json['Payment Plan'];
    policyFileName = json['Policy File Name'];
    policyFileURL = json['Policy File URL'];
    startDate = json['Start Date'];
    state = json['State'];
    tpa = json['TPA'];
    totalPaid = json['Total Paid'];
    payments = json['payments'];
  }

  String? beyondAccountManager;
  String? beyondPolicyNumber;
  String? beyondSalesAgent;
  String? endDate;
  String? insuranceCompany;
  List<String>? branchesList;

  String? insurancePlanType;
  dynamic insurancePolicyNumber;
  String? issuingType;
  String? lineOfBusiness;
  dynamic nextPayment;
  String? nextPaymentDate;
  String? paymentPlan;
  String? policyFileName;
  String? policyFileURL;
  String? startDate;
  String? state;
  String? tpa;
  num? totalPaid;
  num? payments;
}
