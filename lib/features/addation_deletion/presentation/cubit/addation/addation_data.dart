import 'package:bond/features/addation_deletion/data/models/response/relationship_model.dart';

import '../../../data/models/response/branch_response.dart';

class AddationData {
  final List<RelationshipModel>? relationships;
  final BranchesResponse? branches;
  final BranchesResponse? policyPlans;
  final String? msg;

  AddationData({this.relationships, this.msg, this.branches, this.policyPlans});

  AddationData copyWith({
    List<RelationshipModel>? relationships,
    String? msg,
    BranchesResponse? branches,
    BranchesResponse? policyPlans,
  }) {
    return AddationData(
      relationships: relationships ?? this.relationships,
      msg: msg ?? this.msg,
      branches: branches ?? this.branches,
      policyPlans: policyPlans ?? this.policyPlans,
    );
  }
}
