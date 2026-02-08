class PoliciesDataAddation {
  PoliciesDataAddation({
      this.result, 
      this.totalCount, 
      this.totalPages,});

  PoliciesDataAddation.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(PoliciesDataModel.fromJson(v));
      });
    }
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
  }
  List<PoliciesDataModel>? result;
  num? totalCount;
  num? totalPages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    map['total_count'] = totalCount;
    map['total_pages'] = totalPages;
    return map;
  }

}

class PoliciesDataModel {
  PoliciesDataModel({
      this.backAdditionDate, 
      this.backDeletionDate, 
      this.eCards, 
      this.forwardAdditionDate, 
      this.forwardDeletionDate, 
      this.isIbanInAdditionRequired, 
      this.isSalaryInAdditionRequired, 
      this.lineOfBusiness, 
      this.policyId, 
      this.policyNumber, 
      this.policyStartDate, 
      this.policyState, 
      this.reimbursementBankAccount, 
      this.reqAcknowledgement, 
      this.reqArabicName, 
      this.reqEmail, 
      this.reqHiringDate, 
      this.reqNationality, 
      this.reqPhoto,});

  PoliciesDataModel.fromJson(dynamic json) {
    backAdditionDate = json['back_addition_date'];
    backDeletionDate = json['back_deletion_date'];
    eCards = json['e_cards'];
    forwardAdditionDate = json['forward_addition_date'];
    forwardDeletionDate = json['forward_deletion_date'];
    isIbanInAdditionRequired = json['is_iban_in_addition_required'];
    isSalaryInAdditionRequired = json['is_salary_in_addition_required'];
    lineOfBusiness = json['line_of_business'];
    policyId = json['policy_id'];
    policyNumber = json['policy_number'];
    policyStartDate = json['policy_start_date'];
    policyState = json['policy_state'];
    reimbursementBankAccount = json['reimbursement_bank_account'];
    reqAcknowledgement = json['req_acknowledgement'];
    reqArabicName = json['req_arabic_name'];
    reqEmail = json['req_email'];
    reqHiringDate = json['req_hiring_date'];
    reqNationality = json['req_nationality'];
    reqPhoto = json['req_photo'];
  }
  num? backAdditionDate;
  num? backDeletionDate;
  String? eCards;
  num? forwardAdditionDate;
  num? forwardDeletionDate;
  bool? isIbanInAdditionRequired;
  bool? isSalaryInAdditionRequired;
  String? lineOfBusiness;
  num? policyId;
  String? policyNumber;
  String? policyStartDate;
  String? policyState;
  String? reimbursementBankAccount;
  bool? reqAcknowledgement;
  bool? reqArabicName;
  bool? reqEmail;
  bool? reqHiringDate;
  bool? reqNationality;
  bool? reqPhoto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['back_addition_date'] = backAdditionDate;
    map['back_deletion_date'] = backDeletionDate;
    map['e_cards'] = eCards;
    map['forward_addition_date'] = forwardAdditionDate;
    map['forward_deletion_date'] = forwardDeletionDate;
    map['is_iban_in_addition_required'] = isIbanInAdditionRequired;
    map['is_salary_in_addition_required'] = isSalaryInAdditionRequired;
    map['line_of_business'] = lineOfBusiness;
    map['policy_id'] = policyId;
    map['policy_number'] = policyNumber;
    map['policy_start_date'] = policyStartDate;
    map['policy_state'] = policyState;
    map['reimbursement_bank_account'] = reimbursementBankAccount;
    map['req_acknowledgement'] = reqAcknowledgement;
    map['req_arabic_name'] = reqArabicName;
    map['req_email'] = reqEmail;
    map['req_hiring_date'] = reqHiringDate;
    map['req_nationality'] = reqNationality;
    map['req_photo'] = reqPhoto;
    return map;
  }

}