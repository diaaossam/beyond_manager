class TemplateModel {
  TemplateModel({this.template, this.templateName, this.title});

  TemplateModel.fromJson(dynamic json) {
    template = json['Template'];
    templateName = json['Template Name'];
    title = json['Title'];
  }

  String? template;
  String? templateName;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Template'] = template;
    map['Template Name'] = templateName;
    map['Title'] = title;
    return map;
  }

  static List<TemplateModel> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = (response['result']) as List<dynamic>;
    return dataList
        .map<TemplateModel>((item) => TemplateModel.fromJson(item))
        .toList();
  }
}
