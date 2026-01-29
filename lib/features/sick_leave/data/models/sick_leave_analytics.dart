class SickLeaveAnalytics {
  SickLeaveAnalytics({
    this.sickLeaveAnalytic,
    this.top5Diagnosis,
    this.top5EmployeeRequests,
    this.keyMetricsOverviewAnalytic,
  });

  SickLeaveAnalytics.fromJson(dynamic json) {
    if (json['sick_leave_analytic'] != null) {
      sickLeaveAnalytic = [];
      json['sick_leave_analytic'].forEach((v) {
        sickLeaveAnalytic?.add(SickLeaveAnalytic.fromJson(v));
      });
    }
    if (json['key_metrics_overview_analytic'] != null) {
      keyMetricsOverviewAnalytic = [];
      json['key_metrics_overview_analytic'].forEach((v) {
        keyMetricsOverviewAnalytic?.add(SickLeaveAnalytic.fromJson(v));
      });
    }
    if (json['top_5_diagnosis'] != null) {
      top5Diagnosis = [];
      json['top_5_diagnosis'].forEach((v) {
        top5Diagnosis?.add(Top5Diagnosis.fromJson(v));
      });
    }
    if (json['top_5_employee_requests'] != null) {
      top5EmployeeRequests = [];
      json['top_5_employee_requests'].forEach((v) {
        top5EmployeeRequests?.add(Top5EmployeeRequests.fromJson(v));
      });
    }
  }

  List<SickLeaveAnalytic>? sickLeaveAnalytic;
  List<SickLeaveAnalytic>? keyMetricsOverviewAnalytic;
  List<Top5Diagnosis>? top5Diagnosis;
  List<Top5EmployeeRequests>? top5EmployeeRequests;

}

class Top5EmployeeRequests {
  Top5EmployeeRequests({
    this.approvedDays,
    this.name,
    this.requestedDays,
    this.totalRequests,
  });

  Top5EmployeeRequests.fromJson(dynamic json) {
    approvedDays = json['approved_days'];
    name = json['name'];
    requestedDays = json['requested_days'];
    totalRequests = json['total_requests'];
  }

  num? approvedDays;
  String? name;
  num? requestedDays;
  num? totalRequests;

  Top5EmployeeRequests copyWith({
    num? approvedDays,
    String? name,
    num? requestedDays,
    num? totalRequests,
  }) =>
      Top5EmployeeRequests(
        approvedDays: approvedDays ?? this.approvedDays,
        name: name ?? this.name,
        requestedDays: requestedDays ?? this.requestedDays,
        totalRequests: totalRequests ?? this.totalRequests,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['approved_days'] = approvedDays;
    map['name'] = name;
    map['requested_days'] = requestedDays;
    map['total_requests'] = totalRequests;
    return map;
  }
}

class Top5Diagnosis {
  Top5Diagnosis({
    this.count,
    this.diagnosisName,
  });

  Top5Diagnosis.fromJson(dynamic json) {
    count = json['count'];
    diagnosisName = json['diagnosis_name'];
  }

  num? count;
  String? diagnosisName;

  Top5Diagnosis copyWith({
    num? count,
    String? diagnosisName,
  }) =>
      Top5Diagnosis(
        count: count ?? this.count,
        diagnosisName: diagnosisName ?? this.diagnosisName,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['diagnosis_name'] = diagnosisName;
    return map;
  }
}

class SickLeaveAnalytic {
  SickLeaveAnalytic({
    this.month,
    this.numOfRequests,
    this.totalSavedDays,
  });

  SickLeaveAnalytic.fromJson(dynamic json) {
    month = json['month'];
    numOfRequests = json['num_of_requests'];
    totalSavedDays = json['total_saved_days'];
  }

  String? month;
  num? numOfRequests;
  num? totalSavedDays;

  SickLeaveAnalytic copyWith({
    String? month,
    num? numOfRequests,
    num? totalSavedDays,
  }) =>
      SickLeaveAnalytic(
        month: month ?? this.month,
        numOfRequests: numOfRequests ?? this.numOfRequests,
        totalSavedDays: totalSavedDays ?? this.totalSavedDays,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = month;
    map['num_of_requests'] = numOfRequests;
    map['total_saved_days'] = totalSavedDays;
    return map;
  }
}
