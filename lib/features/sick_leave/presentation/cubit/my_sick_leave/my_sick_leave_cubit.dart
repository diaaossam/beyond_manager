import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/sick_leave/data/models/my_sick_leave.dart';
import 'package:bond/features/sick_leave/data/repositories/sick_leave_repo_impl.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';


@injectable
class MySickLeaveCubit extends Cubit<BaseState<int>> {
  final SickLeaveRepositoryImpl sickLeaveRepositoryImpl;

  late final PagingController<int, MySickLeave> pendingPagingController;
  late final PagingController<int, MySickLeave> processingPagingController;
  late final PagingController<int, MySickLeave> donePagingController;

  int currentIndex = 0;
  int? currentPolicyId;

  MySickLeaveCubit(this.sickLeaveRepositoryImpl) : super(BaseState());

  void changeIndex({required int value}) {
    currentIndex = value;
    emit(state.copyWith(data: value));
  }

  Future<void> initPagination({required int policyId}) async {
    currentPolicyId = policyId;

    // Initialize pending controller
    pendingPagingController = PagingController<int, MySickLeave>(
      getNextPageKey: (state) =>
          state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (pageKey) => _fetchMySickLeave(
        pageKey: pageKey,
        status: "pending",
      ),
    );

    // Initialize processing controller
    processingPagingController = PagingController<int, MySickLeave>(
      getNextPageKey: (state) =>
          state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (pageKey) => _fetchMySickLeave(
        pageKey: pageKey,
        status: "processing",
      ),
    );

    // Initialize done controller
    donePagingController = PagingController<int, MySickLeave>(
      getNextPageKey: (state) =>
          state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (pageKey) => _fetchMySickLeave(
        pageKey: pageKey,
        status: "done",
      ),
    );
  }

  Future<List<MySickLeave>> _fetchMySickLeave({
    required int pageKey,
    required String status,
  }) async {
    if (currentPolicyId == null) {
      throw Exception('Policy ID is not set');
    }

    final response = await sickLeaveRepositoryImpl.getMySickLeave(
      page: pageKey,
      status: status,
      policyId: currentPolicyId!,
    );

    return response.fold(
      (failure) {
        throw Exception(failure.message);
      },
      (newItems) => newItems,
    );
  }

  void refreshAll() {
    pendingPagingController.refresh();
    processingPagingController.refresh();
    donePagingController.refresh();
  }

  Future<void> fetchPendingPage({
    required int pageKey,
    required int policyId,
  }) async {
    currentPolicyId = policyId;
    pendingPagingController.refresh();
  }

  Future<void> fetchDonePage({
    required int pageKey,
    required int policyId,
  }) async {
    currentPolicyId = policyId;
    donePagingController.refresh();
  }

  Future<void> fetchProcessingPage({
    required int pageKey,
    required int policyId,
  }) async {
    currentPolicyId = policyId;
    processingPagingController.refresh();
  }

  @override
  Future<void> close() {
    pendingPagingController.dispose();
    processingPagingController.dispose();
    donePagingController.dispose();
    return super.close();
  }
}
