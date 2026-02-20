import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/policies/data/models/request/get_active_list_params.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/helper/async_handler.dart';
import '../../../data/models/response/active_list_model.dart';

@injectable
class ActivePolicyCubit extends Cubit<BaseState<ActiveListModel>>
    with AsyncHandler<ActiveListModel> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  late final PagingController<int, Result> pagingController;
  ActiveListParams? activeListParams;

  ActivePolicyCubit(this.policiesRepositoryImpl) : super(BaseState());

  Future<void> fetchFirstActiveList({required ActiveListParams params}) async {
    emit(state.copyWith(status: BaseStatus.loading));
    activeListParams = params;
    final firstPageResponse = await policiesRepositoryImpl.getActivePolicy(
      activeListParams: params.copyWith(pageKey: 1),
    );
    firstPageResponse.fold(
      (failure) {
        pagingController.value = pagingController.value.copyWith(
          error: failure.message,
          isLoading: false,
        );
        emit(
          state.copyWith(
            status: BaseStatus.success,
            data: ActiveListModel(
              isLife: true,
              isMedical: true,
              result: const [],
            ),
          ),
        );
      },
      (data) {
        emit(state.copyWith(status: BaseStatus.success, data: data));
      },
    );
  }

  Future<void> initPagination() async {
    pagingController = PagingController<int, Result>(
      getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (pageKey) async {
        final pageSize = activeListParams?.pageSize ?? 8;
        final response = await policiesRepositoryImpl.getActivePolicy(
          activeListParams: activeListParams!.copyWith(pageKey: pageKey),
        );
        return response.fold(
          (failure) {
            pagingController.value = pagingController.value.copyWith(
              error: failure,
              isLoading: false,
            );
            return <Result>[];
          },
          (data) {
            final newItems = data.result ?? [];
            final oldModel = state.data;
            final combinedItems = [...?oldModel?.result, ...newItems];
            final updatedModel = data.copyWith(result: combinedItems);
            emit(state.copyWith(status: BaseStatus.success, data: updatedModel));
            final isLastPage = newItems.length < pageSize;
            if (isLastPage) {
              pagingController.value = pagingController.value.copyWith(
                hasNextPage: false,
              );
            }
            return newItems;
          },
        );
      },
    );
  }

  void fetchActiveList({required ActiveListParams params}) {
    activeListParams = params;
    pagingController.refresh();
    emit(state.copyWith(status: BaseStatus.success));
  }
}
