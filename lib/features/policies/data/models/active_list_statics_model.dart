class ActiveListStaticsModel {
  ActiveListStaticsModel(
      {this.ageStatistics,
      this.businessLine,
      this.employee,
      this.familyMembers,
      this.genderDistribution,
      this.monthlyTrend,
      this.policyName,
      this.statusBreakdown,
      this.totalMembers,
      this.totalMembersIncludingDeleted});

  ActiveListStaticsModel.fromJson(dynamic json) {
    ageStatistics = json['age_statistics'] != null
        ? AgeStatistics.fromJson(json['age_statistics'])
        : null;
    businessLine = json['business_line'];
    employee = json['employee'];
    familyMembers = json['family_members'];
    genderDistribution = json['gender_distribution'] != null
        ? GenderDistribution.fromJson(json['gender_distribution'])
        : null;
    if (json['monthly_trend'] != null) {
      monthlyTrend = [];
      json['monthly_trend'].forEach((v) {
        monthlyTrend?.add(MonthlyTrend.fromJson(v));
      });
    }
    policyName = json['policy_name'];
    statusBreakdown = json['status_breakdown'] != null
        ? StatusBreakdown.fromJson(json['status_breakdown'])
        : null;
    totalMembers = json['total_members'];
    totalMembersIncludingDeleted = json['total_members_including_deleted'];
  }

  AgeStatistics? ageStatistics;
  String? businessLine;
  num? employee;
  num? familyMembers;
  GenderDistribution? genderDistribution;
  List<MonthlyTrend>? monthlyTrend;
  String? policyName;
  StatusBreakdown? statusBreakdown;
  num? totalMembers;
  num? totalMembersIncludingDeleted;

}

class StatusBreakdown {
  StatusBreakdown({
    this.added,
    this.deleted,
    this.underAddition,
    this.underDeletion,
  });

  StatusBreakdown.fromJson(dynamic json) {
    added = json['added'];
    deleted = json['deleted'];
    underAddition = json['under_addition'];
    underDeletion = json['under_deletion'];
  }

  num? added;
  num? deleted;
  num? underAddition;
  num? underDeletion;

  StatusBreakdown copyWith({
    num? added,
    num? deleted,
    num? underAddition,
    num? underDeletion,
  }) =>
      StatusBreakdown(
        added: added ?? this.added,
        deleted: deleted ?? this.deleted,
        underAddition: underAddition ?? this.underAddition,
        underDeletion: underDeletion ?? this.underDeletion,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['added'] = added;
    map['deleted'] = deleted;
    map['under_addition'] = underAddition;
    map['under_deletion'] = underDeletion;
    return map;
  }
}

class MonthlyTrend {
  MonthlyTrend({
    this.additions,
    this.deletions,
    this.name,
  });

  MonthlyTrend.fromJson(dynamic json) {
    additions = json['additions'];
    deletions = json['deletions'];
    name = json['name'];
  }

  num? additions;
  num? deletions;
  String? name;

  MonthlyTrend copyWith({
    num? additions,
    num? deletions,
    String? name,
  }) =>
      MonthlyTrend(
        additions: additions ?? this.additions,
        deletions: deletions ?? this.deletions,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['additions'] = additions;
    map['deletions'] = deletions;
    map['name'] = name;
    return map;
  }
}

class GenderDistribution {
  GenderDistribution({
    this.female,
    this.male,
  });

  GenderDistribution.fromJson(dynamic json) {
    female = json['female'];
    male = json['male'];
  }

  num? female;
  num? male;

  GenderDistribution copyWith({
    num? female,
    num? male,
  }) =>
      GenderDistribution(
        female: female ?? this.female,
        male: male ?? this.male,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['female'] = female;
    map['male'] = male;
    return map;
  }
}

class AgeStatistics {
  AgeStatistics({
    this.additionsAgeAverage,
    this.avgAge,
    this.deletionsAgeAverage,
    this.maxAge,
    this.minAge,
  });

  AgeStatistics.fromJson(dynamic json) {
    additionsAgeAverage = json['additions_age_average'];
    avgAge = json['avg_age'];
    deletionsAgeAverage = json['deletions_age_average'];
    maxAge = json['max_age'];
    minAge = json['min_age'];
  }

  num? additionsAgeAverage;
  num? avgAge;
  num? deletionsAgeAverage;
  num? maxAge;
  num? minAge;

  AgeStatistics copyWith({
    num? additionsAgeAverage,
    num? avgAge,
    num? deletionsAgeAverage,
    num? maxAge,
    num? minAge,
  }) =>
      AgeStatistics(
        additionsAgeAverage: additionsAgeAverage ?? this.additionsAgeAverage,
        avgAge: avgAge ?? this.avgAge,
        deletionsAgeAverage: deletionsAgeAverage ?? this.deletionsAgeAverage,
        maxAge: maxAge ?? this.maxAge,
        minAge: minAge ?? this.minAge,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['additions_age_average'] = additionsAgeAverage;
    map['avg_age'] = avgAge;
    map['deletions_age_average'] = deletionsAgeAverage;
    map['max_age'] = maxAge;
    map['min_age'] = minAge;
    return map;
  }
}
