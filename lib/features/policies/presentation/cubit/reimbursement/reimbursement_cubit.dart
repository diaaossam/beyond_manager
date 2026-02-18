import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/policies/data/models/request/reimbursement_filter_model.dart';
import 'package:bond/features/policies/data/models/response/reimbursement_model.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/helper/async_handler.dart';

@Injectable()
class ReimbursementCubit extends Cubit<BaseState<ReimbursementResponseModel>>
    with AsyncHandler<ReimbursementResponseModel> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  ReimbursementCubit(this.policiesRepositoryImpl)
    : super(BaseState(data: ReimbursementResponseModel()));

  late final PagingController<int, ReimbursementModel> pagingController;
  ReimbursementFilterModel? reimbursementFilterModel;

  Future<void> initPagination({ReimbursementFilterModel? initialParams}) async {
    if (initialParams != null) {
      reimbursementFilterModel = initialParams;
    }
    pagingController = PagingController<int, ReimbursementModel>(
      getNextPageKey: (state) =>
          state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (pageKey) async {
        final pageSize = reimbursementFilterModel!.pageSize ?? 8;
        final response = await policiesRepositoryImpl.getReimursement(
          params: reimbursementFilterModel!.copyWith(pageKey: pageKey),
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

  void fetchUtilization({required ReimbursementFilterModel params}) {
    reimbursementFilterModel = params;
    pagingController.refresh();
    emit(state.copyWith(status: BaseStatus.success));
  }

  Future<void> fetchFirstReimbursement({
    required ReimbursementFilterModel params,
  }) async {
    emit(state.copyWith(status: BaseStatus.loading));
    reimbursementFilterModel = params;
    final firstPageResponse = await policiesRepositoryImpl.getReimursement(
      params: params.copyWith(pageKey: 1),
    );
    firstPageResponse.fold(
      (failure) {
        throw Exception(
          'Failed to fetch reimbursement list: ${failure.message}',
        );
      },
      (data) {
        emit(state.copyWith(status: BaseStatus.success, data: data));
      },
    );
  }

  Future<List<ReimbursementModel>> getReimbursementList({
    required ReimbursementFilterModel params,
  }) async {
    final response = await policiesRepositoryImpl.getReimursement(
      params: params,
    );
    return response.fold((failure) => [], (data) => data.result ?? []);
  }

  void fetchPage({required ReimbursementFilterModel params}) {
    reimbursementFilterModel = params;
    pagingController.refresh();
  }
}
