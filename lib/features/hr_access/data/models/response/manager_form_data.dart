import 'package:bond/features/policies/data/models/response/main_policy_model.dart';

class ManagerFormData {
  final MainPolicyModel? policy;
  final String? name;
  final String? email;
  final String? jobTitle;
  final String? mobileNumber;
  final bool accessPayment;
  final bool accessPolicyDetails;
  final bool accessUtilization;
  final bool accessActiveList;
  final bool accessAdditionAndDeletions;
  final bool reimbursement;

  ManagerFormData({
    this.policy,
    this.name,
    this.email,
    this.jobTitle,
    this.mobileNumber,
    this.accessPayment = false,
    this.accessPolicyDetails = false,
    this.accessUtilization = false,
    this.accessActiveList = false,
    this.accessAdditionAndDeletions = false,
    this.reimbursement = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'policy_id': policy?.policyId,
      'name': name,
      'email': email,
      'job_title': jobTitle,
      'mobile_number': mobileNumber,
      'access_payment': accessPayment,
      'access_policy_details': accessPolicyDetails,
      'access_utilization': accessUtilization,
      'access_active_list': accessActiveList,
      'access_addition_and_deletions': accessAdditionAndDeletions,
      'reimbursement': reimbursement,
    };
  }
}
