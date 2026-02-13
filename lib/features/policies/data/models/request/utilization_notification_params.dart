import '../response/notification_value_model.dart';

class UtilizationNotificationParams {
  final num policyId;
  final NotificationValueModel notificationValueModel;

  UtilizationNotificationParams({
    required this.policyId,
    required this.notificationValueModel,
  });


}
