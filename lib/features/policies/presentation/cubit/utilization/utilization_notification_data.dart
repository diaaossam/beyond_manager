import 'package:bond/features/policies/data/models/response/deep_study_model.dart';
import 'package:bond/features/policies/data/models/response/utilization_notification_item_model.dart';

import '../../../data/models/response/notification_value_model.dart';

class UtilizationNotificationData {
  final String? msg;
  final List<DeepStudyModel>? deepStudy;
  final UtilizationNotificationModel? notifications;
  final NotificationValueModel? notificationValueModel;

  UtilizationNotificationData({
    this.msg,
    this.deepStudy,
    this.notifications,
    this.notificationValueModel,
  });

  UtilizationNotificationData copyWith({
    String? msg,
    List<DeepStudyModel>? deepStudy,
    UtilizationNotificationModel? notifications,
    NotificationValueModel? notificationValueModel,
  }) {
    return UtilizationNotificationData(
      msg: msg ?? this.msg,
      deepStudy: deepStudy ?? this.deepStudy,
      notifications: notifications ?? this.notifications,
      notificationValueModel:
          notificationValueModel ?? this.notificationValueModel,
    );
  }
}
