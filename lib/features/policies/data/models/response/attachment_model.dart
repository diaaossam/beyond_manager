class AttachmentModel {
  AttachmentModel({
      this.downloadUrl, 
      this.filename, 
      this.id, 
      this.mimetype, 
      this.name,});

  AttachmentModel.fromJson(dynamic json) {
    downloadUrl = json['download_url'];
    filename = json['filename'];
    id = json['id'];
    mimetype = json['mimetype'];
    name = json['name'];
  }
  String? downloadUrl;
  String? filename;
  num? id;
  String? mimetype;
  String? name;
AttachmentModel copyWith({  String? downloadUrl,
  String? filename,
  num? id,
  String? mimetype,
  String? name,
}) => AttachmentModel(  downloadUrl: downloadUrl ?? this.downloadUrl,
  filename: filename ?? this.filename,
  id: id ?? this.id,
  mimetype: mimetype ?? this.mimetype,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['download_url'] = downloadUrl;
    map['filename'] = filename;
    map['id'] = id;
    map['mimetype'] = mimetype;
    map['name'] = name;
    return map;
  }

}