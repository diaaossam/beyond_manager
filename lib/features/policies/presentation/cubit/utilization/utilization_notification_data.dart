import 'package:bond/features/policies/data/models/response/deep_study_model.dart';
import 'package:bond/features/policies/data/models/response/utilization_notification_item_model.dart';

class UtilizationNotificationData {
  final String? msg;
  final List<DeepStudyModel>? deepStudy;
  final List<UtilizationNotificationItemModel>? notifications;

  UtilizationNotificationData({
    this.msg,
    this.deepStudy,
    this.notifications,
  });

  UtilizationNotificationData copyWith({
    String? msg,
    List<DeepStudyModel>? deepStudy,
    List<UtilizationNotificationItemModel>? notifications,
  }) {
    return UtilizationNotificationData(
      msg: msg ?? this.msg,
      deepStudy: deepStudy ?? this.deepStudy,
      notifications: notifications ?? this.notifications,
    );
  }
}
