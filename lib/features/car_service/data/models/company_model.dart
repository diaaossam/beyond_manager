class CompanyModel {
  final String? carReimbursementConditions;
  final String? insuranceCompany;

  CompanyModel(
      {required this.carReimbursementConditions,
      required this.insuranceCompany});

  factory CompanyModel.fromJson({required Map<String, dynamic> map}) {
    return CompanyModel(
        carReimbursementConditions: map["car_reimbursement_conditions"],
        insuranceCompany: map['insurance_company']);
  }
}
