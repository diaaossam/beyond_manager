import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/policies/data/models/request/get_active_list_params.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/helper/async_handler.dart';
import '../../../data/models/response/utilization_model.dart';

@injectable
class UtilizationCubit extends Cubit<BaseState<UtilizationModel>>
    with AsyncHandler<UtilizationModel> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  late final PagingController<int, Utilization> pagingController;
  ActiveListParams? activeListParams;

  UtilizationCubit(this.policiesRepositoryImpl) : super(BaseState());

  Future<void> fetchFirstUtilization({required ActiveListParams params}) async {
    emit(state.copyWith(status: BaseStatus.loading));
    activeListParams = params;
    final firstPageResponse = await policiesRepositoryImpl.getUtilization(
      activeListParams: params.copyWith(pageKey: 1),
    );
    firstPageResponse.fold(
      (failure) {
        throw Exception(
          'Failed to fetch utilization list: ${failure.message}',
        );
      },
      (data) {
        emit(state.copyWith(status: BaseStatus.success, data: data));
      },
    );
  }

  Future<void> initPagination() async {
    pagingController = PagingController<int, Utilization>(
      getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (pageKey) async {
        final pageSize = activeListParams?.pageSize ?? 8;
        final response = await policiesRepositoryImpl.getUtilization(
          activeListParams: activeListParams!.copyWith(pageKey: pageKey),
        );
        final newModel = response.fold((failure) {
          throw Exception();
        }, (data) => data);
        final newItems = newModel.result ?? [];
        final oldModel = state.data;
        final combinedItems = [...?oldModel?.result, ...newItems];
        final updatedModel = newModel.copyWith(result: combinedItems);
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
  }

  void fetchUtilization({required ActiveListParams params}) {
    activeListParams = params;
    pagingController.refresh();
    emit(state.copyWith(status: BaseStatus.success));
  }



  // Getters for convenience
  bool? get isMedical => state.data?.isMedical;
  String? get lastUpdateDate => state.data?.lastUpdatedDate;
  String get dashboardUrl => state.data?.dashboardLink?.toString() ?? '';
}
