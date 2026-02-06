import 'package:bond/features/addation_deletion/data/models/relationship_model.dart';

class AddationData {
  final List<RelationshipModel>? relationships;
  final String? msg;

  AddationData({this.relationships, this.msg});

  AddationData copyWith({List<RelationshipModel>? relationships, String? msg}) {
    return AddationData(
      relationships: relationships ?? this.relationships,
      msg: msg ?? this.msg,
    );
  }
}
