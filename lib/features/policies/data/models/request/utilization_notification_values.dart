import 'package:bond/features/auth/data/models/response/user_model_helper.dart';

class UtilizationNotificationValues {
  final num policyId;
  final String? totalConsumptionThreshold;
  final String? monthlyConsumptionThreshold;
  final String? employeeAmountThreshold;
  final String? employeeTransactionCountThreshold;

  UtilizationNotificationValues({
    required this.policyId,
    this.totalConsumptionThreshold,
    this.monthlyConsumptionThreshold,
    this.employeeAmountThreshold,
    this.employeeTransactionCountThreshold,
  });

  Map<String, dynamic> toJson() {
    return {
      "total_consumption_threshold": totalConsumptionThreshold,
      "monthly_consumption_threshold": monthlyConsumptionThreshold,
      "employee_amount_threshold": employeeAmountThreshold,
      "employee_transaction_count_threshold": employeeTransactionCountThreshold,
      "hr_email": UserDataService().getUserData()?.email,
      "policy_id": policyId,
    };
  }
}
