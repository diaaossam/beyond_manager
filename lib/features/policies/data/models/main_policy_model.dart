import 'package:logger/logger.dart';

class MainPolicyModel {
  MainPolicyModel({
    this.policyId,
    this.policyNumber,
    this.policyState,
    this.lineOfBusiness,
    this.policyEndDate,
    this.policyStartDate,
  });

  MainPolicyModel.fromJson(dynamic json) {
    policyId = json['policy_id'];
    policyNumber = json['policy_number'];
    policyState = json['policy_state'];
    lineOfBusiness = json['line_of_business'] ?? "";
    policyEndDate = json['policy_end_date'];
    policyStartDate = json['policy_start_date'];
  }

  num? policyId;
  String? policyNumber;
  String? policyState;
  String? lineOfBusiness;
  String? policyStartDate;
  String? policyEndDate;

  static List<MainPolicyModel> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = response['result'] as List<dynamic>;
    return dataList
        .map((item) => MainPolicyModel.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
