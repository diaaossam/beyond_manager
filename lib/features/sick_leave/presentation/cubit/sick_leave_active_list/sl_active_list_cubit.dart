import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/enum/policy_status.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/policies/data/models/response/main_policy_model.dart';
import 'package:bond/features/sick_leave/data/repositories/sick_leave_repo_impl.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

@injectable
class SlActiveListCubit extends Cubit<BaseState<PolicyStatus>> {
  final SickLeaveRepositoryImpl sickLeaveRepositoryImpl;

  late final PagingController<int, MainPolicyModel> activePagingController;
  late final PagingController<int, MainPolicyModel> expiredPagingController;

  PolicyStatus currentStatus = PolicyStatus.active;
  int currentIndex = 0;

  SlActiveListCubit(this.sickLeaveRepositoryImpl) : super(BaseState()) {
    activePagingController = _buildPagingController(PolicyStatus.active);
    expiredPagingController = _buildPagingController(PolicyStatus.expired);
  }

  void changeIndex(int index) {
    currentIndex = index;
    currentStatus = index == 0 ? PolicyStatus.active : PolicyStatus.expired;
    emit(state.copyWith(data: currentStatus));
  }

  Future<List<MainPolicyModel>> _getSickLeaveActiveList({
    required int page,
    required String state,
  }) async {
    final response = await sickLeaveRepositoryImpl.getSickLeaveActiveList(
      page: page,
      state: state,
    );
    return response.fold((l) => [], (r) => r);
  }

  PagingController<int, MainPolicyModel> _buildPagingController(PolicyStatus status) {
    late final PagingController<int, MainPolicyModel> controller;
    controller = PagingController(
      getNextPageKey: (state) => _nextIntPageKey(state, firstPageKey: 1),
      fetchPage: (pageKey) async {
        final newItems = await _getSickLeaveActiveList(
          page: pageKey,
          state: status.name,
        );
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
    PagingState<int, MainPolicyModel> state, {
    required int firstPageKey,
  }) {
    if (state.lastPageIsEmpty) return state.nextIntPageKey;
    return state.nextIntPageKey;
  }

  @override
  Future<void> close() {
    activePagingController.dispose();
    expiredPagingController.dispose();
    return super.close();
  }

  Future<void> fetchPage({
    required int pageKey,
    required String state,
    required PagingController<int, MainPolicyModel> pagingController,
  }) async {
    // This method is kept for backward compatibility
    // The actual fetching is handled by the PagingController internally
  }
}
