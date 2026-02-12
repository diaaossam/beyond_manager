import 'package:bond/features/hr_access/data/models/response/manager_list_item.dart';
import 'package:bond/features/policies/data/models/response/main_policy_model.dart';

class UpdateHrAccessData {
  final List<ManagerListItem>? managers;
  final List<MainPolicyModel>? policies;
  final String? msg;

  UpdateHrAccessData({
    this.managers,
    this.policies,
    this.msg,
  });

  UpdateHrAccessData copyWith({
    List<ManagerListItem>? managers,
    List<MainPolicyModel>? policies,
    String? msg,
  }) {
    return UpdateHrAccessData(
      managers: managers ?? this.managers,
      policies: policies ?? this.policies,
      msg: msg ?? this.msg,
    );
  }
}
