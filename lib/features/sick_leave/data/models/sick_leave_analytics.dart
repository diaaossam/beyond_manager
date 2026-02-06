class SickLeaveAnalytics {
  SickLeaveAnalytics({
      this.keyMetricsOverviewAnalytic, 
      this.policyId, 
      this.sickLeaveAnalytic, 
      this.top5Diagnosis, 
      this.top5DiagnosisByDays, 
      this.top5EmployeeRequests, 
      this.top5EmployeesByDays, 
      this.totalSavedDays,});

  SickLeaveAnalytics.fromJson(dynamic json) {
    if (json['key_metrics_overview_analytic'] != null) {
      keyMetricsOverviewAnalytic = [];
      json['key_metrics_overview_analytic'].forEach((v) {
        keyMetricsOverviewAnalytic?.add(KeyMetricsOverviewAnalytic.fromJson(v));
      });
    }
    policyId = json['policy_id'];
    if (json['sick_leave_analytic'] != null) {
      sickLeaveAnalytic = [];
      json['sick_leave_analytic'].forEach((v) {
        sickLeaveAnalytic?.add(SickLeaveAnalytic.fromJson(v));
      });
    }
    if (json['top_5_diagnosis'] != null) {
      top5Diagnosis = [];
      json['top_5_diagnosis'].forEach((v) {
        top5Diagnosis?.add(Top5Diagnosis.fromJson(v));
      });
    }
    if (json['top_5_diagnosis_by_days'] != null) {
      top5DiagnosisByDays = [];
      json['top_5_diagnosis_by_days'].forEach((v) {
        top5DiagnosisByDays?.add(Top5DiagnosisByDays.fromJson(v));
      });
    }
    if (json['top_5_employee_requests'] != null) {
      top5EmployeeRequests = [];
      json['top_5_employee_requests'].forEach((v) {
        top5EmployeeRequests?.add(Top5EmployeeRequests.fromJson(v));
      });
    }
    if (json['top_5_employees_by_days'] != null) {
      top5EmployeesByDays = [];
      json['top_5_employees_by_days'].forEach((v) {
        top5EmployeesByDays?.add(Top5EmployeesByDays.fromJson(v));
      });
    }
    totalSavedDays = json['total_saved_days'];
  }
  List<KeyMetricsOverviewAnalytic>? keyMetricsOverviewAnalytic;
  num? policyId;
  List<SickLeaveAnalytic>? sickLeaveAnalytic;
  List<Top5Diagnosis>? top5Diagnosis;
  List<Top5DiagnosisByDays>? top5DiagnosisByDays;
  List<Top5EmployeeRequests>? top5EmployeeRequests;
  List<Top5EmployeesByDays>? top5EmployeesByDays;
  num? totalSavedDays;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (keyMetricsOverviewAnalytic != null) {
      map['key_metrics_overview_analytic'] = keyMetricsOverviewAnalytic?.map((v) => v.toJson()).toList();
    }
    map['policy_id'] = policyId;
    if (sickLeaveAnalytic != null) {
      map['sick_leave_analytic'] = sickLeaveAnalytic?.map((v) => v.toJson()).toList();
    }
    if (top5Diagnosis != null) {
      map['top_5_diagnosis'] = top5Diagnosis?.map((v) => v.toJson()).toList();
    }
    if (top5DiagnosisByDays != null) {
      map['top_5_diagnosis_by_days'] = top5DiagnosisByDays?.map((v) => v.toJson()).toList();
    }
    if (top5EmployeeRequests != null) {
      map['top_5_employee_requests'] = top5EmployeeRequests?.map((v) => v.toJson()).toList();
    }
    if (top5EmployeesByDays != null) {
      map['top_5_employees_by_days'] = top5EmployeesByDays?.map((v) => v.toJson()).toList();
    }
    map['total_saved_days'] = totalSavedDays;
    return map;
  }

}

class Top5EmployeesByDays {
  Top5EmployeesByDays({
      this.name, 
      this.totalDays, 
      this.totalRequests,});

  Top5EmployeesByDays.fromJson(dynamic json) {
    name = json['name'];
    totalDays = json['total_days'];
    totalRequests = json['total_requests'];
  }
  String? name;
  num? totalDays;
  num? totalRequests;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['total_days'] = totalDays;
    map['total_requests'] = totalRequests;
    return map;
  }

}

class Top5EmployeeRequests {
  Top5EmployeeRequests({
      this.approvedDays, 
      this.name, 
      this.requestedDays, 
      this.totalRequests,});

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

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['approved_days'] = approvedDays;
    map['name'] = name;
    map['requested_days'] = requestedDays;
    map['total_requests'] = totalRequests;
    return map;
  }

}

class Top5DiagnosisByDays {
  Top5DiagnosisByDays({
      this.count, 
      this.diagnosisName, 
      this.totalDays,});

  Top5DiagnosisByDays.fromJson(dynamic json) {
    count = json['count'];
    diagnosisName = json['diagnosis_name'];
    totalDays = json['total_days'];
  }
  num? count;
  String? diagnosisName;
  num? totalDays;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['diagnosis_name'] = diagnosisName;
    map['total_days'] = totalDays;
    return map;
  }

}

class Top5Diagnosis {
  Top5Diagnosis({
      this.count, 
      this.diagnosisName, 
      this.totalDays,});

  Top5Diagnosis.fromJson(dynamic json) {
    count = json['count'];
    diagnosisName = json['diagnosis_name'];
    totalDays = json['total_days'];
  }
  num? count;
  String? diagnosisName;
  num? totalDays;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['diagnosis_name'] = diagnosisName;
    map['total_days'] = totalDays;
    return map;
  }

}

class SickLeaveAnalytic {
  SickLeaveAnalytic({
      this.month, 
      this.numOfRequests, 
      this.totalSavedDays,});

  SickLeaveAnalytic.fromJson(dynamic json) {
    month = json['month'];
    numOfRequests = json['num_of_requests'];
    totalSavedDays = json['total_saved_days'];
  }
  String? month;
  num? numOfRequests;
  num? totalSavedDays;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = month;
    map['num_of_requests'] = numOfRequests;
    map['total_saved_days'] = totalSavedDays;
    return map;
  }

}

class KeyMetricsOverviewAnalytic {
  KeyMetricsOverviewAnalytic({
      this.month, 
      this.numOfRequests, 
      this.totalSavedDays,});

  KeyMetricsOverviewAnalytic.fromJson(dynamic json) {
    month = json['month'];
    numOfRequests = json['num_of_requests'];
    totalSavedDays = json['total_saved_days'];
  }
  String? month;
  num? numOfRequests;
  num? totalSavedDays;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = month;
    map['num_of_requests'] = numOfRequests;
    map['total_saved_days'] = totalSavedDays;
    return map;
  }

}