class AppSettings {
  AppSettings({
      this.complaintsEmail, 
      this.complaintsPhone, 
      this.defaultSmsCode, 
      this.description, 
      this.emergency, 
      this.pdfLink, 
      this.pdfLinkUi, 
      this.reimbursementApiTutorialVideo, 
      this.showRegisterButton, 
      this.sickLeave, 
      this.smsBaseUrl, 
      this.smsPassword, 
      this.smsSenderId, 
      this.smsUserName,});

  AppSettings.fromJson(dynamic json) {
    complaintsEmail = json['complaintsEmail'];
    complaintsPhone = json['complaintsPhone'];
    defaultSmsCode = json['defaultSmsCode'];
    description = json['description'];
    emergency = json['emergency'];
    pdfLink = json['pdfLink'];
    pdfLinkUi = json['pdfLinkUi'];
    reimbursementApiTutorialVideo = json['reimbursement_api_tutorial_video'];
    showRegisterButton = json['show_register_button'];
    sickLeave = json['sickLeave'];
    smsBaseUrl = json['smsBaseUrl'];
    smsPassword = json['smsPassword'];
    smsSenderId = json['smsSenderId'];
    smsUserName = json['smsUserName'];
  }
  String? complaintsEmail;
  String? complaintsPhone;
  String? defaultSmsCode;
  String? description;
  String? emergency;
  String? pdfLink;
  String? pdfLinkUi;
  String? reimbursementApiTutorialVideo;
  String? showRegisterButton;
  String? sickLeave;
  String? smsBaseUrl;
  String? smsPassword;
  String? smsSenderId;
  String? smsUserName;
AppSettings copyWith({  String? complaintsEmail,
  String? complaintsPhone,
  String? defaultSmsCode,
  String? description,
  String? emergency,
  String? pdfLink,
  String? pdfLinkUi,
  String? reimbursementApiTutorialVideo,
  String? showRegisterButton,
  String? sickLeave,
  String? smsBaseUrl,
  String? smsPassword,
  String? smsSenderId,
  String? smsUserName,
}) => AppSettings(  complaintsEmail: complaintsEmail ?? this.complaintsEmail,
  complaintsPhone: complaintsPhone ?? this.complaintsPhone,
  defaultSmsCode: defaultSmsCode ?? this.defaultSmsCode,
  description: description ?? this.description,
  emergency: emergency ?? this.emergency,
  pdfLink: pdfLink ?? this.pdfLink,
  pdfLinkUi: pdfLinkUi ?? this.pdfLinkUi,
  reimbursementApiTutorialVideo: reimbursementApiTutorialVideo ?? this.reimbursementApiTutorialVideo,
  showRegisterButton: showRegisterButton ?? this.showRegisterButton,
  sickLeave: sickLeave ?? this.sickLeave,
  smsBaseUrl: smsBaseUrl ?? this.smsBaseUrl,
  smsPassword: smsPassword ?? this.smsPassword,
  smsSenderId: smsSenderId ?? this.smsSenderId,
  smsUserName: smsUserName ?? this.smsUserName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['complaintsEmail'] = complaintsEmail;
    map['complaintsPhone'] = complaintsPhone;
    map['defaultSmsCode'] = defaultSmsCode;
    map['description'] = description;
    map['emergency'] = emergency;
    map['pdfLink'] = pdfLink;
    map['pdfLinkUi'] = pdfLinkUi;
    map['reimbursement_api_tutorial_video'] = reimbursementApiTutorialVideo;
    map['show_register_button'] = showRegisterButton;
    map['sickLeave'] = sickLeave;
    map['smsBaseUrl'] = smsBaseUrl;
    map['smsPassword'] = smsPassword;
    map['smsSenderId'] = smsSenderId;
    map['smsUserName'] = smsUserName;
    return map;
  }

}