class DeepStudyModel {
  DeepStudyModel({
    this.corClientId,
    this.corClientName,
    this.createdById,
    this.createdByName,
    this.hasReplyAttachment,
    this.hrEmail,
    this.id,
    this.message,
    this.policyId,
    this.policyName,
    this.reply,
    this.replyAttachmentFilename,
    this.replyAttachmentUrl,
    this.requestDate,
    this.sequenceNumber,
    this.status,
  });

  DeepStudyModel.fromJson(dynamic json) {
    corClientId = json['cor_client_id'];
    corClientName = json['cor_client_name'];
    createdById = json['created_by_id'];
    createdByName = json['created_by_name'];
    hasReplyAttachment = json['has_reply_attachment'];
    hrEmail = json['hr_email'];
    id = json['id'];
    message = json['message'];
    policyId = json['policy_id'];
    policyName = json['policy_name'];
    reply = json['reply'];
    replyAttachmentFilename = json['reply_attachment_filename'];
    replyAttachmentUrl = json['reply_attachment_url'];
    requestDate = json['request_date'];
    sequenceNumber = json['sequence_number'];
    status = json['status'];
  }

  num? corClientId;
  String? corClientName;
  num? createdById;
  String? createdByName;
  bool? hasReplyAttachment;
  String? hrEmail;
  num? id;
  String? message;
  num? policyId;
  String? policyName;
  String? reply;
  String? replyAttachmentFilename;
  String? replyAttachmentUrl;
  String? requestDate;
  String? sequenceNumber;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cor_client_id'] = corClientId;
    map['cor_client_name'] = corClientName;
    map['created_by_id'] = createdById;
    map['created_by_name'] = createdByName;
    map['has_reply_attachment'] = hasReplyAttachment;
    map['hr_email'] = hrEmail;
    map['id'] = id;
    map['message'] = message;
    map['policy_id'] = policyId;
    map['policy_name'] = policyName;
    map['reply'] = reply;
    map['reply_attachment_filename'] = replyAttachmentFilename;
    map['reply_attachment_url'] = replyAttachmentUrl;
    map['request_date'] = requestDate;
    map['sequence_number'] = sequenceNumber;
    map['status'] = status;
    return map;
  }

  static List<DeepStudyModel> fromJsonList(dynamic response) {
    return response['result']['studies']
        .map<DeepStudyModel>((item) => DeepStudyModel.fromJson(item))
        .toList();
  }
}
