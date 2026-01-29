import 'package:bond/core/enum/status_enum.dart';

class MySickLeave {
  MySickLeave(
      {this.clientAttachments,
      this.date,
      this.id,
      this.name,
      this.policyID,
      this.responseAttachments,
      this.state,
      this.feedback,
      this.insuredMemberId,
      this.insuredMemberInsuranceId,
      this.insuredMemberName,
      this.summary,
      this.change_state_date,
      this.number_of_days_approved,
      this.date_of_injury,
      this.return_date});

  MySickLeave.fromJson(dynamic json) {
    if (json['Client Attachments'] != null) {
      clientAttachments = [];
      json['Client Attachments'].forEach((v) {
        clientAttachments?.add(ClientAttachments.fromJson(v));
      });
    }
    date = json['Date'];
    id = json['Id'];
    name = json['Name'];
    policyID = json['Policy ID'];
    if (json['Response Attachments'] != null) {
      responseAttachments = [];
      json['Response Attachments'].forEach((v) {
        responseAttachments?.add(ResponseAttachments.fromJson(v));
      });
    }
    state = handleStringToStatusEnum(status: json['State']);
    feedback = json['feedback'];
    insuredMemberId = json['insured_member_id'];
    insuredMemberInsuranceId = json['insured_member_insurance_id'];
    insuredMemberName = json['insured_member_name'] ?? json['other'];
    summary = json['summary'];
    number_of_days_approved = json['number_of_days_approved'];
    change_state_date = json['change_state_date'] ?? "";
    date_of_injury = json['date_of_injury'] ?? "";
    return_date = json['return_date'] ?? "";
  }

  static List<MySickLeave> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = response['result'] as List<dynamic>;
    return dataList
        .map((item) => MySickLeave.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  List<ClientAttachments>? clientAttachments;
  String? date;
  num? id;
  String? name;
  num? policyID;
  List<ResponseAttachments>? responseAttachments;
  StatusEnum? state;
  String? feedback;
  num? insuredMemberId;
  String? insuredMemberInsuranceId;
  String? insuredMemberName;
  String? change_state_date;
  num? number_of_days_approved;
  String? summary;
  String? date_of_injury;
  String? return_date;
}

class ResponseAttachments {
  ResponseAttachments({
    this.id,
    this.url,
  });

  ResponseAttachments.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
  }

  num? id;
  String? url;

  ResponseAttachments copyWith({
    num? id,
    String? url,
  }) =>
      ResponseAttachments(
        id: id ?? this.id,
        url: url ?? this.url,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    return map;
  }
}

class ClientAttachments {
  ClientAttachments({
    this.id,
    this.url,
    this.fileName,
  });

  ClientAttachments.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    fileName = json['file_name'];
  }

  num? id;
  String? url;
  String? fileName;

  ClientAttachments copyWith({
    num? id,
    String? url,
    String? fileName,
  }) =>
      ClientAttachments(
        id: id ?? this.id,
        fileName: fileName ?? this.fileName,
        url: url ?? this.url,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['file_name'] = fileName;
    return map;
  }
}
