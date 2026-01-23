import 'attachment_model.dart';

class ReimbursementResponseModel {
  String? tutorialVideo;
  String? lastUpdatedDate;
  String? totalCount;
  List<ReimbursementModel>? result;

  ReimbursementResponseModel({
    this.tutorialVideo,
    this.lastUpdatedDate,
    this.totalCount,
    this.result,
  });

  ReimbursementResponseModel.fromJson(dynamic json) {
    lastUpdatedDate = json['last_updated_date'];
    totalCount = json['total_count'];
    tutorialVideo = json['tutorial_video'];
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result?.add(ReimbursementModel.fromJson(v));
      });
    }

  }
}

class ReimbursementModel {
  ReimbursementModel({
    this.approvedAmount,
    this.attachmentFiles,
    this.batchNo,
    this.breakdownFiles,
    this.breakdownReason,
    this.claimStatus,
    this.claimedAmount,
    this.idNumber,
    this.lineName,
    this.memberName,
    this.missingDocs,
    this.mobileNumber,
    this.paymentProofFiles,
    this.paymentState,
    this.serviceDate,
    this.serviceType,
    this.staffId,
    this.tutorialVideo,
    this.claimStatusInfo,
    this.statusInfo,
    this.reimbursement_copy_type,
  });

  ReimbursementModel.fromJson(dynamic json) {
    approvedAmount = json['approved_amount'].toString();
    reimbursement_copy_type = json['reimbursement_copy_type'].toString();
    attachmentFiles = json['attachment_files'] != null
        ? json['attachment_files']
              .map<AttachmentModel>((e) => AttachmentModel.fromJson(e))
              .toList()
        : [];
    batchNo = json['batch_no'];

    breakdownFiles = json['breakdown_files'] != null
        ? json['breakdown_files']
              .map<AttachmentModel>((e) => AttachmentModel.fromJson(e))
              .toList()
        : [];

    breakdownReason = json['breakdown_reason'];

    claimStatus = json['claim_status'];
    claimStatusInfo = json['status_info'] ?? "";

    claimedAmount = json['claimed_amount'].toString();
    idNumber = json['id_number'];
    lineName = json['line_name'];

    memberName = json['member_name'];
    missingDocs = json['missing_docs'];

    mobileNumber = json['mobile_number'];
    paymentProofFiles = json['payment_proof_files'] != null
        ? json['payment_proof_files']
              .map<AttachmentModel>((e) => AttachmentModel.fromJson(e))
              .toList()
        : [];
    paymentState = json['payment_state'];
    serviceDate = json['service_date'];
    serviceType = json['service_type'];
    staffId = json['staff_id'];
    tutorialVideo = json['tutorial_video'];
    statusInfo = json['status_info'].toString().replaceAll("\n", "");
  }

  String? approvedAmount;
  List<AttachmentModel>? attachmentFiles;
  String? batchNo;
  List<AttachmentModel>? breakdownFiles;
  String? breakdownReason;
  String? claimStatus;
  String? claimedAmount;
  String? idNumber;
  String? lineName;
  String? memberName;
  String? claimStatusInfo;
  String? missingDocs;
  String? mobileNumber;
  List<AttachmentModel>? paymentProofFiles;
  String? paymentState;
  String? serviceDate;
  String? serviceType;
  String? staffId;
  String? tutorialVideo;
  String? statusInfo;
  String? reimbursement_copy_type;
}
