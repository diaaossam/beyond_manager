import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/policies/data/models/request/get_active_list_params.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../data/models/response/active_list_model.dart';

@injectable
class ActivePolicyCubit extends Cubit<BaseState<ActiveListModel>>
    with AsyncHandler<ActiveListModel> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  late final PagingController<int, Result> pagingController;
  ActiveListParams ? activeListParams;
  ActivePolicyCubit(this.policiesRepositoryImpl) : super(BaseState());

  Future<void> fetchActiveList({required ActiveListParams params}) async {
    emit(state.copyWith(status: BaseStatus.loading));
    pagingController = PagingController<int, Result>(
      getNextPageKey: (state) => _nextIntPageKey(state, firstPageKey: 1),
      fetchPage: (pageKey) async {
        final response = await policiesRepositoryImpl.getActivePolicy(
          activeListParams: params.copyWith(pageKey: pageKey),
        );

        final newModel = response.getOrElse(() => ActiveListModel());
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

  int _nextIntPageKey(
    PagingState<int, Result> state, {
    required int firstPageKey,
  }) {
    final keys = state.keys;
    if (keys == null || keys.isEmpty) {
      return firstPageKey;
    }
    return keys.last + 1;
  }

}
