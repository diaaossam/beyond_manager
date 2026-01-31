class CompanyModel {
  final String? carReimbursementConditions;
  final String? insuranceCompany;

  CompanyModel({
    required this.carReimbursementConditions,
    required this.insuranceCompany,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> map) {
    return CompanyModel(
      carReimbursementConditions: map["car_reimbursement_conditions"],
      insuranceCompany: map['insurance_company'],
    );
  }

  static List<CompanyModel> fromJsonList(List<dynamic> list) {
    return list.map((e) => CompanyModel.fromJson(e)).toList();
  }
}
