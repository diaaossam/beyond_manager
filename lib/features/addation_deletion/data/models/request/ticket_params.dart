class TicketParams {
  final String? stage;
  final String? memberName;
  final String? staffid;

  TicketParams({this.stage, this.memberName, this.staffid});

  TicketParams copyWith({String? stage, String? memberName, String? staffid}) =>
      TicketParams(
        stage: stage ?? this.stage,
        memberName: memberName ?? this.memberName,
        staffid: staffid ?? this.staffid,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stage'] = stage;
    map['member_name'] = memberName;
    map['staffid'] = staffid;

    map.removeWhere((key, value) => value == null);
    return map;
  }
}