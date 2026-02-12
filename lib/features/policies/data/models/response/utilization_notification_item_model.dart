class UtilizationNotificationItemModel {
  UtilizationNotificationItemModel({
      this.exceededMembersCountThreshold, 
      this.exceededMembersEmployeeAmountThreshold, 
      this.exceededMembersTotalConsumptionThreshold, 
      this.exceededMonths, 
      this.summary,});

  UtilizationNotificationItemModel.fromJson(dynamic json) {
    if (json['exceeded_members_count_threshold'] != null) {
      exceededMembersCountThreshold = [];
      json['exceeded_members_count_threshold'].forEach((v) {
        exceededMembersCountThreshold?.add(ExceededMembersCountThreshold.fromJson(v));
      });
    }
    if (json['exceeded_members_employee_amount_threshold'] != null) {
      exceededMembersEmployeeAmountThreshold = [];
      json['exceeded_members_employee_amount_threshold'].forEach((v) {
        exceededMembersEmployeeAmountThreshold?.add(ExceededMembersEmployeeAmountThreshold.fromJson(v));
      });
    }
    exceededMembersTotalConsumptionThreshold = json['exceeded_members_total_consumption_threshold'];
    if (json['exceeded_months'] != null) {
      exceededMonths = [];
      json['exceeded_months'].forEach((v) {
        exceededMonths?.add(ExceededMonths.fromJson(v));
      });
    }
    summary = json['summary'] != null ? Summary.fromJson(json['summary']) : null;
  }
  List<ExceededMembersCountThreshold>? exceededMembersCountThreshold;
  List<ExceededMembersEmployeeAmountThreshold>? exceededMembersEmployeeAmountThreshold;
  num? exceededMembersTotalConsumptionThreshold;
  List<ExceededMonths>? exceededMonths;
  Summary? summary;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (exceededMembersCountThreshold != null) {
      map['exceeded_members_count_threshold'] = exceededMembersCountThreshold?.map((v) => v.toJson()).toList();
    }
    if (exceededMembersEmployeeAmountThreshold != null) {
      map['exceeded_members_employee_amount_threshold'] = exceededMembersEmployeeAmountThreshold?.map((v) => v.toJson()).toList();
    }
    map['exceeded_members_total_consumption_threshold'] = exceededMembersTotalConsumptionThreshold;
    if (exceededMonths != null) {
      map['exceeded_months'] = exceededMonths?.map((v) => v.toJson()).toList();
    }
    if (summary != null) {
      map['summary'] = summary?.toJson();
    }
    return map;
  }

}

class Summary {
  Summary({
      this.totalEmployees, 
      this.totalMonthlySpending, 
      this.totalSpending,});

  Summary.fromJson(dynamic json) {
    totalEmployees = json['total_employees'];
    totalMonthlySpending = json['total_monthly_spending'];
    totalSpending = json['total_spending'];
  }
  num? totalEmployees;
  num? totalMonthlySpending;
  num? totalSpending;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_employees'] = totalEmployees;
    map['total_monthly_spending'] = totalMonthlySpending;
    map['total_spending'] = totalSpending;
    return map;
  }

}

class ExceededMonths {
  ExceededMonths({
      this.month, 
      this.totalAmount,});

  ExceededMonths.fromJson(dynamic json) {
    month = json['month'];
    totalAmount = json['total_amount'];
  }
  String? month;
  num? totalAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = month;
    map['total_amount'] = totalAmount;
    return map;
  }

}

class ExceededMembersEmployeeAmountThreshold {
  ExceededMembersEmployeeAmountThreshold({
      this.memberName, 
      this.totalAmount,});

  ExceededMembersEmployeeAmountThreshold.fromJson(dynamic json) {
    memberName = json['member_name'];
    totalAmount = json['total_amount'];
  }
  String? memberName;
  num? totalAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['member_name'] = memberName;
    map['total_amount'] = totalAmount;
    return map;
  }

}

class ExceededMembersCountThreshold {
  ExceededMembersCountThreshold({
      this.memberName, 
      this.usageCount,});

  ExceededMembersCountThreshold.fromJson(dynamic json) {
    memberName = json['member_name'];
    usageCount = json['usage_count'];
  }
  String? memberName;
  num? usageCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['member_name'] = memberName;
    map['usage_count'] = usageCount;
    return map;
  }

}