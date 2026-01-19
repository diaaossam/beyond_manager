part of 'active_policy_bloc.dart';

class ActivePolicyState {
  final String? lastUpdateDate;
  final bool? isMedical;
  final bool? isBusiness;
  final bool showExcel;
  final ActiveListStaticsModel? staticsModel;
  final String? error;

  const ActivePolicyState({
    this.lastUpdateDate,
    this.isMedical,
    this.isBusiness,
    this.showExcel = false,
    this.staticsModel,
    this.error,
  });
}
