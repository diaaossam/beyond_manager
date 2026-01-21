import 'package:bloc/bloc.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/policies/data/models/utilization_policy_model.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:bond/features/policies/data/models/get_active_list_params.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

part 'utilization_state.dart';

@injectable
class UtilizationCubit extends Cubit<UtilizationState> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  late final PagingController<int, Utilization> pagingController;
  
  String lastUpdateDate = "";
  bool? isMedical;
  String dashboardUrl = "";
  ActiveListParams? _currentParams;

  UtilizationCubit(this.policiesRepositoryImpl) : super(UtilizationState()) {
    pagingController = _buildPagingController();
  }

  Future<void> initUtilization({required int policyId}) async {
    _currentParams = ActiveListParams(
      policyId: policyId,
      pageKey: 1,
      pageSize: pageSize,
    );
    
    final response = await policiesRepositoryImpl.getUtilization(
      getActiveListParams: _currentParams!,
    );
    
    response.fold(
      (l) => emit(UtilizationState(error: l.message)),
      (r) {
        lastUpdateDate = r.lastUpdatedDate ?? "";
        isMedical = r.isMedical ?? false;
        dashboardUrl = r.dashboardLink ?? "";
        emit(UtilizationState(
          lastUpdateDate: lastUpdateDate,
          isMedical: isMedical,
          dashboardUrl: dashboardUrl,
        ));
      },
    );
  }

  Future<List<Utilization>> _getUtilization({
    required ActiveListParams params,
  }) async {
    final response = await policiesRepositoryImpl.getUtilization(
      getActiveListParams: params,
    );
    return response.fold(
      (l) => [],
      (r) => r.result ?? [],
    );
  }

  PagingController<int, Utilization> _buildPagingController() {
    late final PagingController<int, Utilization> controller;
    controller = PagingController(
      getNextPageKey: (state) => _nextIntPageKey(state, firstPageKey: 1),
      fetchPage: (pageKey) async {
        if (_currentParams == null) return [];
        
        final params = _currentParams!.copyWith(pageKey: pageKey);
        final newItems = await _getUtilization(params: params);
        final isLastPage = newItems.length < pageSize;
        
        if (isLastPage) {
          controller.value = controller.value.copyWith(hasNextPage: false);
        }
        
        return newItems;
      },
    );
    return controller;
  }

  int _nextIntPageKey(
    PagingState<int, Utilization> state, {
    required int firstPageKey,
  }) {
    final keys = state.keys;
    if (keys == null || keys.isEmpty) {
      return firstPageKey;
    }
    return keys.last + 1;
  }

  void updateFilters(ActiveListParams newParams) {
    _currentParams = newParams;
    pagingController.refresh();
  }
}
