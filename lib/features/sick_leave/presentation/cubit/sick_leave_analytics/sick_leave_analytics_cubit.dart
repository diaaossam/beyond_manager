import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/sick_leave/data/models/sick_leave_analytics.dart';
import 'package:bond/features/sick_leave/data/repositories/sick_leave_repo_impl.dart';
import 'package:injectable/injectable.dart';

@injectable
class SickLeaveAnalyticsCubit extends Cubit<BaseState<SickLeaveAnalytics>>
    with AsyncHandler<SickLeaveAnalytics> {
  final SickLeaveRepositoryImpl sickLeaveRepositoryImpl;

  SickLeaveAnalyticsCubit(this.sickLeaveRepositoryImpl) : super(BaseState());

  Future<void> getSickLeaveAnalytics({required int policyId}) async {
    await handleAsync(
      call: () => sickLeaveRepositoryImpl.getSickLeaveAnalytics(
        policyId: policyId,
      ),
      onSuccess: (data) => data,
      identifier: 'get_sick_leave_analytics',
    );
  }

  /// Alias for backward compatibility
  Future<void> getSickLeaveAnalyticsFromApi({required int policyId}) =>
      getSickLeaveAnalytics(policyId: policyId);
}
