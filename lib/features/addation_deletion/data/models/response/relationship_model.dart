import 'package:equatable/equatable.dart';

class RelationshipModel extends Equatable {
  const RelationshipModel({this.id, this.memberType, this.name});

  static List<RelationshipModel> fromJsonList(dynamic response) {
    return response
        .map<RelationshipModel>((item) => RelationshipModel.fromJson(item))
        .toList();
  }

  factory RelationshipModel.fromJson(Map<String, dynamic> json) {
    return RelationshipModel(
      id: json['id'],
      memberType: json['member_type'],
      name: json['name'],
    );
  }

  final num? id;
  final String? memberType;
  final String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['member_type'] = memberType;
    map['name'] = name;
    return map;
  }

  @override
  List<Object?> get props => [id, memberType, name];
}
