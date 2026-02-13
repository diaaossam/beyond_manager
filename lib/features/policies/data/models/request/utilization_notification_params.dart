import '../response/notification_value_model.dart';

class UtilizationNotificationParams {
  final num policyId;
  final NotificationValueModel notificationValueModel;

  UtilizationNotificationParams({
    required this.policyId,
    required this.notificationValueModel,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['policy_id'] = policyId;
    if (notificationValueModel.totalConsumptionThreshold != null &&
        notificationValueModel.totalConsumptionThreshold != 0 &&
        notificationValueModel.totalConsumptionEnabled == true) {
     // map['total_consumption_threshold'] = notificationValueModel.totalConsumptionThreshold ?? 0;
      map['total_consumption_threshold'] = "12000";
    }
    if (notificationValueModel.monthlyConsumptionThreshold != null &&
        notificationValueModel.monthlyConsumptionThreshold != 0 &&
        notificationValueModel.monthlyConsumptionEnabled == true) {
      map['monthly_consumption_threshold'] =
          notificationValueModel.monthlyConsumptionThreshold ?? 0;
    }
    if (notificationValueModel.employeeAmountThreshold != null &&
        notificationValueModel.employeeAmountThreshold != 0 &&
        notificationValueModel.employeeAmountEnabled == true) {
      map['employee_amount_threshold'] =
          notificationValueModel.employeeAmountThreshold ?? 0;
    }
    if (notificationValueModel.employeeTransactionCountThreshold != null &&
        notificationValueModel.employeeTransactionCountThreshold != 0 &&
        notificationValueModel.employeeTransactionCountEnabled == true) {
      map['employee_transaction_count_threshold'] =
          notificationValueModel.employeeTransactionCountThreshold ?? 0;
    }
    return map;
  }
}
