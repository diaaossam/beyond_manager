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
    map['notification_values'] = notificationValueModel.toJson();
    return map;
  }
}
