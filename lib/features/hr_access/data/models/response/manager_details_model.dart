import 'policy_access_item.dart';

class ManagerDetailsModel {
  final num? managerId;
  final String? name;
  final String? email;
  final String? jobTitle;
  final String? mobileNumber;
  final bool reimbursement;
  final List<PolicyAccessItem> policies;

  ManagerDetailsModel({
    this.managerId,
    this.name,
    this.email,
    this.jobTitle,
    this.mobileNumber,
    this.reimbursement = false,
    this.policies = const [],
  });

  factory ManagerDetailsModel.fromJson(Map<String, dynamic> json) {
    List<PolicyAccessItem> policiesList = [];
    if (json['policies'] != null) {
      final list = json['policies'] as List<dynamic>;
      policiesList =
          list.map((e) => PolicyAccessItem.fromJson(e as Map<String, dynamic>)).toList();
    }
    return ManagerDetailsModel(
      managerId: json['manager_id'],
      name: json['name'] as String?,
      email: json['email'] as String?,
      jobTitle: json['job_title'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      reimbursement: json['reimbursement'] == true,
      policies: policiesList,
    );
  }
}
