import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/policies/data/models/response/main_policy_model.dart';
import 'package:bond/features/sick_leave/data/repositories/sick_leave_repo_impl.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

@injectable
class SlActiveListCubit extends Cubit<BaseState<String>> {
  final SickLeaveRepositoryImpl sickLeaveRepositoryImpl;

  late final PagingController<int, MainPolicyModel> activePagingController;
  late final PagingController<int, MainPolicyModel> expiredPagingController;

  String currentStatus = "active";
  int currentIndex = 0;

  SlActiveListCubit(this.sickLeaveRepositoryImpl) : super(BaseState()) {
    activePagingController = _buildPagingController("active");
    expiredPagingController = _buildPagingController("expired");
  }

  void changeIndex(int index) {
    currentIndex = index;
    currentStatus = index == 0 ? "active" : "expired";
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

  PagingController<int, MainPolicyModel> _buildPagingController(String status) {
    late final PagingController<int, MainPolicyModel> controller;
    controller = PagingController(
      getNextPageKey: (state) => _nextIntPageKey(state, firstPageKey: 1),
      fetchPage: (pageKey) async {
        final newItems = await _getSickLeaveActiveList(
          page: pageKey,
          state: status,
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
}
