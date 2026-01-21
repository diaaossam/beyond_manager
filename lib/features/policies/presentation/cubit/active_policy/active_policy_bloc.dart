import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/policies/data/models/active_list_policy_model.dart';
import 'package:bond/features/policies/data/models/active_list_statics_model.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:bond/features/policies/data/models/get_active_list_params.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

part 'active_policy_state.dart';

@injectable
class ActivePolicyCubit extends Cubit<BaseState<ActivePolicyState>> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  late final PagingController<int, ActiveListResult> pagingController;

  ActivePolicyCubit(this.policiesRepositoryImpl) : super(BaseState());
/*
  Future<void> initGetActiveList({required int policyId}) async {
    final response = await getActivePoliciesUseCase(
      getActiveListParams: GetActiveListParams(
        policyId: policyId,
        pageKey: 1,
        pageSize: pageSize,
      ),
    );
    response.fold((l) {}, (r) {
      lastUpdateDate = r.lastUpdatedDate ?? "";
      isBusiness = r.isisBusinessLife ?? false;
      isMedical = r.isMedical ?? false;
      staticsModel = r.activeListStaticsModel;
      if (r.result != null) {
        if (r.result!.isNotEmpty) {
          showExcel = true;
        }
      }
      emit(GetActiveListState());
    });
  }

  Future<List<ActiveListResult>> getActiveList({
    required GetActiveListParams getActiveListParams,
  }) async {
    List<ActiveListResult> list = [];
    final response = await getActivePoliciesUseCase(
      getActiveListParams: getActiveListParams,
    );
    response.fold(
      (l) {
        return [];
      },
      (r) {
        list = r.result ?? [];
        totalMembers = r.activeListStaticsModel?.totalMembers;
        showExcel = true;
        emit(SetActiveListMembers());
      },
    );
    return list;
  }

  Future<void> fetchPage({
    required GetActiveListParams getActiveListParams,
  }) async {
    try {
      final newItems = await getActiveList(
        getActiveListParams: getActiveListParams,
      );
      final isLastPage = newItems.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = getActiveListParams.pageKey + 1;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }*/
}
