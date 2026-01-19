part of 'utilization_bloc.dart';

class UtilizationState {
  final String? lastUpdateDate;
  final bool? isMedical;
  final String? dashboardUrl;
  final String? error;

  const UtilizationState({
    this.lastUpdateDate,
    this.isMedical,
    this.dashboardUrl,
    this.error,
  });
}
