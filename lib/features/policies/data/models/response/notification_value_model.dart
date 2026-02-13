class NotificationValueModel {
  NotificationValueModel({
    this.employeeAmountThreshold,
    this.employeeTransactionCountThreshold,
    this.monthlyConsumptionThreshold,
    this.policyId,
    this.totalConsumptionThreshold,
    this.userManagerId,
  });

  NotificationValueModel.fromJson(dynamic json) {
    employeeAmountThreshold = json['employee_amount_threshold'] ?? 0;
    employeeTransactionCountThreshold =
        json['employee_transaction_count_threshold'] ?? 0;
    monthlyConsumptionThreshold = json['monthly_consumption_threshold'] ?? 0;
    policyId = json['policy_id'];
    totalConsumptionThreshold = json['total_consumption_threshold'] ?? 0;
    userManagerId = json['user_manager_id'] ?? 0;
  }

  num? employeeAmountThreshold;
  num? employeeTransactionCountThreshold;
  num? monthlyConsumptionThreshold;
  num? policyId;
  num? totalConsumptionThreshold;
  num? userManagerId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['employee_amount_threshold'] = employeeAmountThreshold;
    map['employee_transaction_count_threshold'] =
        employeeTransactionCountThreshold;
    map['monthly_consumption_threshold'] = monthlyConsumptionThreshold;
    map['policy_id'] = policyId;
    map['total_consumption_threshold'] = totalConsumptionThreshold;
    map['user_manager_id'] = userManagerId;
    return map;
  }
}
