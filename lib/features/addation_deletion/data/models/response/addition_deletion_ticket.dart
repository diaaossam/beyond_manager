class AdditionDeletionTicket {
  AdditionDeletionTicket({
      this.result, 
      this.returnedTicketsCount, 
      this.totalCount, 
      this.totalPages,});

  AdditionDeletionTicket.fromJson(dynamic json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(AdditionDeletionTicketModel.fromJson(v));
      });
    }
    returnedTicketsCount = json['returned_tickets_count'];
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
  }
  List<AdditionDeletionTicketModel>? result;
  num? returnedTicketsCount;
  num? totalCount;
  num? totalPages;
AdditionDeletionTicket copyWith({  List<AdditionDeletionTicketModel>? result,
  num? returnedTicketsCount,
  num? totalCount,
  num? totalPages,
}) => AdditionDeletionTicket(  result: result ?? this.result,
  returnedTicketsCount: returnedTicketsCount ?? this.returnedTicketsCount,
  totalCount: totalCount ?? this.totalCount,
  totalPages: totalPages ?? this.totalPages,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (result != null) {
      map['result'] = result?.map((v) => v.toJson()).toList();
    }
    map['returned_tickets_count'] = returnedTicketsCount;
    map['total_count'] = totalCount;
    map['total_pages'] = totalPages;
    return map;
  }

}

class AdditionDeletionTicketModel {
  AdditionDeletionTicketModel({
      this.additionDeletionTriggered, 
      this.confirmedMembers, 
      this.confirmedMembersCount, 
      this.createDate, 
      this.id, 
      this.lineOfBusinessName, 
      this.name, 
      this.policyIds, 
      this.policyNames, 
      this.requestType, 
      this.stage, 
      this.startPeriodWaitingHr, 
      this.ticketType, 
      this.totalMembersCount, 
      this.waitingMembers, 
      this.waitingMembersCount,});

  AdditionDeletionTicketModel.fromJson(dynamic json) {
    additionDeletionTriggered = json['addition_deletion_triggered'];
    if (json['confirmed_members'] != null) {
      confirmedMembers = [];
      json['confirmed_members'].forEach((v) {
        confirmedMembers?.add(ConfirmedMembers.fromJson(v));
      });
    }
    confirmedMembersCount = json['confirmed_members_count'];
    createDate = json['create_date'];
    id = json['id'];
    lineOfBusinessName = json['line_of_business_name'];
    name = json['name'];
    policyIds = json['policy_ids'] != null ? json['policy_ids'].cast<num>() : [];
    policyNames = json['policy_names'] != null ? json['policy_names'].cast<String>() : [];
    requestType = json['request_type'];
    stage = json['stage'];
    startPeriodWaitingHr = json['start_period_waiting_hr'];
    ticketType = json['ticket_type'];
    totalMembersCount = json['total_members_count'];
    if (json['waiting_members'] != null) {
      waitingMembers = [];
      json['waiting_members'].forEach((v) {
        waitingMembers?.add(v);
      });
    }
    waitingMembersCount = json['waiting_members_count'];
  }
  String? additionDeletionTriggered;
  List<ConfirmedMembers>? confirmedMembers;
  num? confirmedMembersCount;
  String? createDate;
  num? id;
  String? lineOfBusinessName;
  String? name;
  List<num>? policyIds;
  List<String>? policyNames;
  String? requestType;
  String? stage;
  String? startPeriodWaitingHr;
  String? ticketType;
  num? totalMembersCount;
  List<dynamic>? waitingMembers;
  num? waitingMembersCount;
AdditionDeletionTicketModel copyWith({  String? additionDeletionTriggered,
  List<ConfirmedMembers>? confirmedMembers,
  num? confirmedMembersCount,
  String? createDate,
  num? id,
  String? lineOfBusinessName,
  String? name,
  List<num>? policyIds,
  List<String>? policyNames,
  String? requestType,
  String? stage,
  String? startPeriodWaitingHr,
  String? ticketType,
  num? totalMembersCount,
  List<dynamic>? waitingMembers,
  num? waitingMembersCount,
}) => AdditionDeletionTicketModel(  additionDeletionTriggered: additionDeletionTriggered ?? this.additionDeletionTriggered,
  confirmedMembers: confirmedMembers ?? this.confirmedMembers,
  confirmedMembersCount: confirmedMembersCount ?? this.confirmedMembersCount,
  createDate: createDate ?? this.createDate,
  id: id ?? this.id,
  lineOfBusinessName: lineOfBusinessName ?? this.lineOfBusinessName,
  name: name ?? this.name,
  policyIds: policyIds ?? this.policyIds,
  policyNames: policyNames ?? this.policyNames,
  requestType: requestType ?? this.requestType,
  stage: stage ?? this.stage,
  startPeriodWaitingHr: startPeriodWaitingHr ?? this.startPeriodWaitingHr,
  ticketType: ticketType ?? this.ticketType,
  totalMembersCount: totalMembersCount ?? this.totalMembersCount,
  waitingMembers: waitingMembers ?? this.waitingMembers,
  waitingMembersCount: waitingMembersCount ?? this.waitingMembersCount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['addition_deletion_triggered'] = additionDeletionTriggered;
    if (confirmedMembers != null) {
      map['confirmed_members'] = confirmedMembers?.map((v) => v.toJson()).toList();
    }
    map['confirmed_members_count'] = confirmedMembersCount;
    map['create_date'] = createDate;
    map['id'] = id;
    map['line_of_business_name'] = lineOfBusinessName;
    map['name'] = name;
    map['policy_ids'] = policyIds;
    map['policy_names'] = policyNames;
    map['request_type'] = requestType;
    map['stage'] = stage;
    map['start_period_waiting_hr'] = startPeriodWaitingHr;
    map['ticket_type'] = ticketType;
    map['total_members_count'] = totalMembersCount;
    if (waitingMembers != null) {
      map['waiting_members'] = waitingMembers?.map((v) => v.toJson()).toList();
    }
    map['waiting_members_count'] = waitingMembersCount;
    return map;
  }

}

class ConfirmedMembers {
  ConfirmedMembers({
      this.arInsuredMember, 
      this.branchId, 
      this.branchName, 
      this.endDate, 
      this.gender, 
      this.id, 
      this.insuranceId, 
      this.insuredMember, 
      this.maritalStatus, 
      this.memberStatus, 
      this.mobilenumber, 
      this.nationalnumber, 
      this.planId, 
      this.policyId, 
      this.relation, 
      this.staffid, 
      this.startDate,});

  ConfirmedMembers.fromJson(dynamic json) {
    arInsuredMember = json['ar_insured_member'];
    branchId = json['branch_id'];
    branchName = json['branch_name'];
    endDate = json['end_date'];
    gender = json['gender'];
    id = json['id'];
    insuranceId = json['insurance_id'];
    insuredMember = json['insured_member'];
    maritalStatus = json['marital_status'];
    memberStatus = json['member_status'];
    mobilenumber = json['mobilenumber'];
    nationalnumber = json['nationalnumber'];
    planId = json['plan_id'];
    policyId = json['policy_id'];
    relation = json['relation'];
    staffid = json['staffid'];
    startDate = json['start_date'];
  }
  String? arInsuredMember;
  num? branchId;
  String? branchName;
  String? endDate;
  String? gender;
  num? id;
  String? insuranceId;
  String? insuredMember;
  String? maritalStatus;
  String? memberStatus;
  String? mobilenumber;
  String? nationalnumber;
  String? planId;
  num? policyId;
  String? relation;
  String? staffid;
  String? startDate;
ConfirmedMembers copyWith({  String? arInsuredMember,
  num? branchId,
  String? branchName,
  String? endDate,
  String? gender,
  num? id,
  String? insuranceId,
  String? insuredMember,
  String? maritalStatus,
  String? memberStatus,
  String? mobilenumber,
  String? nationalnumber,
  String? planId,
  num? policyId,
  String? relation,
  String? staffid,
  String? startDate,
}) => ConfirmedMembers(  arInsuredMember: arInsuredMember ?? this.arInsuredMember,
  branchId: branchId ?? this.branchId,
  branchName: branchName ?? this.branchName,
  endDate: endDate ?? this.endDate,
  gender: gender ?? this.gender,
  id: id ?? this.id,
  insuranceId: insuranceId ?? this.insuranceId,
  insuredMember: insuredMember ?? this.insuredMember,
  maritalStatus: maritalStatus ?? this.maritalStatus,
  memberStatus: memberStatus ?? this.memberStatus,
  mobilenumber: mobilenumber ?? this.mobilenumber,
  nationalnumber: nationalnumber ?? this.nationalnumber,
  planId: planId ?? this.planId,
  policyId: policyId ?? this.policyId,
  relation: relation ?? this.relation,
  staffid: staffid ?? this.staffid,
  startDate: startDate ?? this.startDate,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ar_insured_member'] = arInsuredMember;
    map['branch_id'] = branchId;
    map['branch_name'] = branchName;
    map['end_date'] = endDate;
    map['gender'] = gender;
    map['id'] = id;
    map['insurance_id'] = insuranceId;
    map['insured_member'] = insuredMember;
    map['marital_status'] = maritalStatus;
    map['member_status'] = memberStatus;
    map['mobilenumber'] = mobilenumber;
    map['nationalnumber'] = nationalnumber;
    map['plan_id'] = planId;
    map['policy_id'] = policyId;
    map['relation'] = relation;
    map['staffid'] = staffid;
    map['start_date'] = startDate;
    return map;
  }

}