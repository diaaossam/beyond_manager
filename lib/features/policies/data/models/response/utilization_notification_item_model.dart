class UtilizationNotificationItemModel {
  UtilizationNotificationItemModel({
    this.id,
    this.message,
    this.policyId,
    this.policyName,
    this.createdAt,
    this.type,
    this.thresholdValue,
  });

  UtilizationNotificationItemModel.fromJson(dynamic json) {
    id = json['id'];
    message = json['message'];
    policyId = json['policy_id'];
    policyName = json['policy_name'];
    createdAt = json['created_at'];
    type = json['type'];
    thresholdValue = json['threshold_value'];
  }

  num? id;
  String? message;
  num? policyId;
  String? policyName;
  String? createdAt;
  String? type;
  num? thresholdValue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['message'] = message;
    map['policy_id'] = policyId;
    map['policy_name'] = policyName;
    map['created_at'] = createdAt;
    map['type'] = type;
    map['threshold_value'] = thresholdValue;
    return map;
  }

  static List<UtilizationNotificationItemModel> fromJsonList(dynamic response) {
    final list = response['result']?['notifications'];
    if (list == null || list is! List) return [];
    return list
        .map<UtilizationNotificationItemModel>(
            (item) => UtilizationNotificationItemModel.fromJson(item))
        .toList();
  }
}
