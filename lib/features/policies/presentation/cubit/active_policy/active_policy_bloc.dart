import 'package:bloc/bloc.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/policies/data/models/active_list_policy_model.dart';
import 'package:bond/features/policies/data/models/active_list_statics_model.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:bond/features/policies/data/models/get_active_list_params.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

part 'active_policy_state.dart';

@injectable
class ActivePolicyCubit extends Cubit<ActivePolicyState> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  late final PagingController<int, ActiveListResult> pagingController;
  
  String lastUpdateDate = "";
  bool? isMedical;
  bool? isBusiness;
  bool showExcel = false;
  num? totalMembers;
  ActiveListStaticsModel? staticsModel;
  GetActiveListParams? _currentParams;

  ActivePolicyCubit(this.policiesRepositoryImpl) : super(ActivePolicyState()) {
    pagingController = _buildPagingController();
  }

  Future<void> initGetActiveList({required int policyId}) async {
    _currentParams = GetActiveListParams(
      policyId: policyId,
      pageKey: 1,
      pageSize: pageSize,
    );
    
    final response = await policiesRepositoryImpl.getActivePolicy(
      getActiveListParams: _currentParams!,
    );
    
    response.fold(
      (l) => emit(ActivePolicyState(error: l.message)),
      (r) {
        lastUpdateDate = r.lastUpdatedDate ?? "";
        isBusiness = r.isisBusinessLife ?? false;
        isMedical = r.isMedical ?? false;
        staticsModel = r.activeListStaticsModel;
        if (r.result != null && r.result!.isNotEmpty) {
          showExcel = true;
        }
        emit(ActivePolicyState(
          lastUpdateDate: lastUpdateDate,
          isMedical: isMedical,
          isBusiness: isBusiness,
          showExcel: showExcel,
          staticsModel: staticsModel,
        ));
      },
    );
  }

  Future<List<ActiveListResult>> _getActiveList({
    required GetActiveListParams params,
  }) async {
    final response = await policiesRepositoryImpl.getActivePolicy(
      getActiveListParams: params,
    );
    return response.fold(
      (l) => [],
      (r) {
        totalMembers = r.activeListStaticsModel?.totalMembers;
        if (r.result != null && r.result!.isNotEmpty) {
          showExcel = true;
        }
        return r.result ?? [];
      },
    );
  }

  PagingController<int, ActiveListResult> _buildPagingController() {
    late final PagingController<int, ActiveListResult> controller;
    controller = PagingController(
      getNextPageKey: (state) => _nextIntPageKey(state, firstPageKey: 1),
      fetchPage: (pageKey) async {
        if (_currentParams == null) return [];
        
        final params = _currentParams!.copyWith(pageKey: pageKey);
        final newItems = await _getActiveList(params: params);
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
    PagingState<int, ActiveListResult> state, {
    required int firstPageKey,
  }) {
    final keys = state.keys;
    if (keys == null || keys.isEmpty) {
      return firstPageKey;
    }
    return keys.last + 1;
  }

  void updateFilters(GetActiveListParams newParams) {
    _currentParams = newParams;
    pagingController.refresh();
  }
}
