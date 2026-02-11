import 'package:bond/features/policies/data/models/response/main_policy_model.dart';

class CreateHrAccessData {
  final List<MainPolicyModel>? policies;
  final String? msg;

  CreateHrAccessData({this.policies, this.msg});

  CreateHrAccessData copyWith({
    List<MainPolicyModel>? policies,
    String? msg,
  }) {
    return CreateHrAccessData(
      policies: policies ?? this.policies,
      msg: msg ?? this.msg,
    );
  }
}
