import '../../../../../core/enum/member_status_enum.dart';

class ActiveListModel {
  ActiveListModel({
    this.isLife,
    this.isMedical,
    this.lastUpdatedDate,
    this.currentPage,
    this.message,
    this.pageSize,
    this.result,
    this.statistics,
    this.totalCount,
    this.totalCountIncludingDeleted,
    this.totalPages,
  });

  ActiveListModel.fromJson(dynamic json) {
    isLife = json['Is Life'];
    isMedical = json['Is Medical'];
    lastUpdatedDate = json['Last Updated Date'];
    currentPage = json['current_page'];
    message = json['message'];
    pageSize = json['page_size'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(Result.fromJson(v));
      });
    }
    statistics = json['statistics'] != null
        ? Statistics.fromJson(json['statistics'])
        : null;
    totalCount = json['total_count'];
    totalCountIncludingDeleted = json['total_count_including_deleted'];
    totalPages = json['total_pages'];
  }

  bool? isLife;
  bool? isMedical;
  String? lastUpdatedDate;
  num? currentPage;
  String? message;
  num? pageSize;
  List<Result>? result;
  Statistics? statistics;
  num? totalCount;
  num? totalCountIncludingDeleted;
  num? totalPages;

  ActiveListModel copyWith({
    bool? isLife,
    bool? isMedical,
    String? lastUpdatedDate,
    num? currentPage,
    String? message,
    num? pageSize,
    List<Result>? result,
    Statistics? statistics,
    num? totalCount,
    num? totalCountIncludingDeleted,
    num? totalPages,
  }) => ActiveListModel(
    isLife: isLife ?? this.isLife,
    isMedical: isMedical ?? this.isMedical,
    lastUpdatedDate: lastUpdatedDate ?? this.lastUpdatedDate,
    currentPage: currentPage ?? this.currentPage,
    message: message ?? this.message,
    pageSize: pageSize ?? this.pageSize,
    result: result ?? this.result,
    statistics: statistics ?? this.statistics,
    totalCount: totalCount ?? this.totalCount,
    totalCountIncludingDeleted:
        totalCountIncludingDeleted ?? this.totalCountIncludingDeleted,
    totalPages: totalPages ?? this.totalPages,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Is Life'] = isLife;
    map['Is Medical'] = isMedical;
    map['Last Updated Date'] = lastUpdatedDate;
    map['current_page'] = currentPage;
    map['message'] = message;
    map['page_size'] = pageSize;
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    if (statistics != null) {
      map['statistics'] = statistics?.toJson();
    }
    map['total_count'] = totalCount;
    map['total_count_including_deleted'] = totalCountIncludingDeleted;
    map['total_pages'] = totalPages;
    return map;
  }
}

class Statistics {
  Statistics({
    this.activeCount,
    this.activeMembers,
    this.ageStatistics,
    this.averageAge,
    this.businessLine,
    this.deletedCount,
    this.deletions,
    this.employee,
    this.familyMembers,
    this.genderDistribution,
    this.lastUpdated,
    this.monthlyTrend,
    this.policyId,
    this.policyName,
    this.relationBreakdown,
    this.statusBreakdown,
    this.totalMembers,
    this.totalMembersIncludingDeleted,
  });

  Statistics.fromJson(dynamic json) {
    activeCount = json['activeCount'];
    activeMembers = json['activeMembers'];
    ageStatistics = json['age_statistics'] != null
        ? AgeStatistics.fromJson(json['age_statistics'])
        : null;
    averageAge = json['averageAge'];
    businessLine = json['business_line'];
    deletedCount = json['deletedCount'];
    deletions = json['deletions'];
    employee = json['employee'];
    familyMembers = json['family_members'];
    genderDistribution = json['gender_distribution'] != null
        ? GenderDistribution.fromJson(json['gender_distribution'])
        : null;
    lastUpdated = json['last_updated'];
    if (json['monthly_trend'] != null) {
      monthlyTrend = [];
      json['monthly_trend'].forEach((v) {
        monthlyTrend?.add(MonthlyTrend.fromJson(v));
      });
    }
    policyId = json['policy_id'];
    policyName = json['policy_name'];
    relationBreakdown = json['relation_breakdown'] != null
        ? RelationBreakdown.fromJson(json['relation_breakdown'])
        : null;
    statusBreakdown = json['status_breakdown'] != null
        ? StatusBreakdown.fromJson(json['status_breakdown'])
        : null;
    totalMembers = json['total_members'];
    totalMembersIncludingDeleted = json['total_members_including_deleted'];
  }

  num? activeCount;
  String? activeMembers;
  AgeStatistics? ageStatistics;
  num? averageAge;
  String? businessLine;
  num? deletedCount;
  String? deletions;
  num? employee;
  num? familyMembers;
  GenderDistribution? genderDistribution;
  String? lastUpdated;
  List<MonthlyTrend>? monthlyTrend;
  String? policyId;
  String? policyName;
  RelationBreakdown? relationBreakdown;
  StatusBreakdown? statusBreakdown;
  num? totalMembers;
  num? totalMembersIncludingDeleted;

  Statistics copyWith({
    num? activeCount,
    String? activeMembers,
    AgeStatistics? ageStatistics,
    num? averageAge,
    String? businessLine,
    num? deletedCount,
    String? deletions,
    num? employee,
    num? familyMembers,
    GenderDistribution? genderDistribution,
    String? lastUpdated,
    List<MonthlyTrend>? monthlyTrend,
    String? policyId,
    String? policyName,
    RelationBreakdown? relationBreakdown,
    StatusBreakdown? statusBreakdown,
    num? totalMembers,
    num? totalMembersIncludingDeleted,
  }) => Statistics(
    activeCount: activeCount ?? this.activeCount,
    activeMembers: activeMembers ?? this.activeMembers,
    ageStatistics: ageStatistics ?? this.ageStatistics,
    averageAge: averageAge ?? this.averageAge,
    businessLine: businessLine ?? this.businessLine,
    deletedCount: deletedCount ?? this.deletedCount,
    deletions: deletions ?? this.deletions,
    employee: employee ?? this.employee,
    familyMembers: familyMembers ?? this.familyMembers,
    genderDistribution: genderDistribution ?? this.genderDistribution,
    lastUpdated: lastUpdated ?? this.lastUpdated,
    monthlyTrend: monthlyTrend ?? this.monthlyTrend,
    policyId: policyId ?? this.policyId,
    policyName: policyName ?? this.policyName,
    relationBreakdown: relationBreakdown ?? this.relationBreakdown,
    statusBreakdown: statusBreakdown ?? this.statusBreakdown,
    totalMembers: totalMembers ?? this.totalMembers,
    totalMembersIncludingDeleted:
        totalMembersIncludingDeleted ?? this.totalMembersIncludingDeleted,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['activeCount'] = activeCount;
    map['activeMembers'] = activeMembers;
    if (ageStatistics != null) {
      map['age_statistics'] = ageStatistics?.toJson();
    }
    map['averageAge'] = averageAge;
    map['business_line'] = businessLine;
    map['deletedCount'] = deletedCount;
    map['deletions'] = deletions;
    map['employee'] = employee;
    map['family_members'] = familyMembers;
    if (genderDistribution != null) {
      map['gender_distribution'] = genderDistribution?.toJson();
    }
    map['last_updated'] = lastUpdated;
    if (monthlyTrend != null) {
      map['monthly_trend'] = monthlyTrend?.map((v) => v.toJson()).toList();
    }
    map['policy_id'] = policyId;
    map['policy_name'] = policyName;
    if (relationBreakdown != null) {
      map['relation_breakdown'] = relationBreakdown?.toJson();
    }
    if (statusBreakdown != null) {
      map['status_breakdown'] = statusBreakdown?.toJson();
    }
    map['total_members'] = totalMembers;
    map['total_members_including_deleted'] = totalMembersIncludingDeleted;
    return map;
  }
}

class StatusBreakdown {
  StatusBreakdown({
    this.added,
    this.deleted,
    this.empty,
    this.underAddition,
    this.underDeletion,
  });

  StatusBreakdown.fromJson(dynamic json) {
    added = json['added'];
    deleted = json['deleted'];
    empty = json['empty'];
    underAddition = json['under_addition'];
    underDeletion = json['under_deletion'];
  }

  num? added;
  num? deleted;
  num? empty;
  num? underAddition;
  num? underDeletion;

  StatusBreakdown copyWith({
    num? added,
    num? deleted,
    num? empty,
    num? underAddition,
    num? underDeletion,
  }) => StatusBreakdown(
    added: added ?? this.added,
    deleted: deleted ?? this.deleted,
    empty: empty ?? this.empty,
    underAddition: underAddition ?? this.underAddition,
    underDeletion: underDeletion ?? this.underDeletion,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['added'] = added;
    map['deleted'] = deleted;
    map['empty'] = empty;
    map['under_addition'] = underAddition;
    map['under_deletion'] = underDeletion;
    return map;
  }
}

class RelationBreakdown {
  RelationBreakdown({this.child, this.other, this.principal, this.spouse});

  RelationBreakdown.fromJson(dynamic json) {
    child = json['child'];
    other = json['other'];
    principal = json['principal'];
    spouse = json['spouse'];
  }

  num? child;
  num? other;
  num? principal;
  num? spouse;

  RelationBreakdown copyWith({
    num? child,
    num? other,
    num? principal,
    num? spouse,
  }) => RelationBreakdown(
    child: child ?? this.child,
    other: other ?? this.other,
    principal: principal ?? this.principal,
    spouse: spouse ?? this.spouse,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['child'] = child;
    map['other'] = other;
    map['principal'] = principal;
    map['spouse'] = spouse;
    return map;
  }
}

class MonthlyTrend {
  MonthlyTrend({this.additions, this.deletions, this.name});

  MonthlyTrend.fromJson(dynamic json) {
    additions = json['additions'];
    deletions = json['deletions'];
    name = json['name'];
  }

  num? additions;
  num? deletions;
  String? name;

  MonthlyTrend copyWith({num? additions, num? deletions, String? name}) =>
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
  GenderDistribution({this.female, this.male});

  GenderDistribution.fromJson(dynamic json) {
    female = json['female'];
    male = json['male'];
  }

  num? female;
  num? male;

  GenderDistribution copyWith({num? female, num? male}) => GenderDistribution(
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
  }) => AgeStatistics(
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

class Result {
  Result(
      {this.bankAccount,
        this.beyondDeletionDate,
        this.branch,
        this.category,
        this.dateOfBirth,
        this.deletionDate,
        this.endDate,
        this.insuranceCardName,
        this.member,
        this.plan,
        this.principleInsuranceId,
        this.relation,
        this.staff,
        this.startDate,
        this.memberId,
        this.isDeleted,
        this.uploadType,
        this.insuranceID,
        this.reactivationDate,
        this.value,
        this.name,
        this.policyNumber});

  Result.fromJson(dynamic json) {
    bankAccount = json['Bank Account'];
    beyondDeletionDate = json['Beyond Deletion Date'];
    branch = json['Branch'];
    category = json['Category'];
    dateOfBirth = json['Date Of Birth'];
    deletionDate = json['Deletion Date'];
    endDate = json['End Date'];
    insuranceCardName = json['Insurance Card Name'];
    member = json['Member'];
    plan = json['Plan'];
    principleInsuranceId = json['Principle Insurance Id'];
    relation = json['Relation'];
    staff = json['Staff'];
    startDate = json['Start Date'];
    uploadType = json['Upload Type'];
    insuranceID = json['insurance ID'];
    isDeleted = json['Is Deleted'];
    memberStatus = handleMemberStatsToString(value: json['Member Status']);
    policyNumber = json['Policy Number'];
    reactivationDate = json['Reactivation Date'];
    name = json['Name'];
    value = json['Value'];
    memberId = json['Member ID'];
  }

  String? bankAccount;
  String? beyondDeletionDate;
  dynamic branch;
  String? category;
  String? dateOfBirth;
  String? deletionDate;
  String? endDate;
  String? insuranceCardName;
  String? member;
  int? memberId;
  String? plan;
  String? principleInsuranceId;
  String? relation;
  String? memberStatus;
  String? staff;
  String? startDate;
  String? uploadType;
  String? insuranceID;
  String? policyNumber;
  String? reactivationDate;
  String? name;
  String? value;
  String? isDeleted;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Bank Account'] = bankAccount;
    map['Beyond Deletion Date'] = beyondDeletionDate;
    map['Branch'] = branch;
    map['Category'] = category;
    map['Date Of Birth'] = dateOfBirth;
    map['Deletion Date'] = deletionDate;
    map['End Date'] = endDate;
    map['Insurance Card Name'] = insuranceCardName;
    map['Member'] = member;
    map['Member ID'] = memberId;
    map['Plan'] = plan;
    map['Principle Insurance Id'] = principleInsuranceId;
    map['Relation'] = relation;
    map['Member Status'] = memberStatus;
    map['Staff'] = staff;
    map['Start Date'] = startDate;
    map['Upload Type'] = uploadType;
    map['insurance ID'] = insuranceID;
    map['Policy Number'] = policyNumber;
    map['Reactivation Date'] = reactivationDate;
    map['Name'] = name;
    map['Value'] = value;
    map['Is Deleted'] = isDeleted;
    return map;
  }
}
