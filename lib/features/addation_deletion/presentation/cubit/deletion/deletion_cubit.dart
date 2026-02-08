import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/addation_deletion/data/repositories/addation_deletion_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/helper/async_handler.dart';
import '../../../../policies/data/models/request/get_active_list_params.dart';
import '../../../data/models/response/deletion_response_model.dart';

@injectable
class DeletionCubit extends Cubit<BaseState<DeletionResponseModel>>
    with AsyncHandler<DeletionResponseModel> {
  final AddationDeletionRepository deletionRepository;

  late final PagingController<int, DeletionMemberModel> pagingController;
  ActiveListParams? activeListParams;

  DeletionCubit(this.deletionRepository) : super(BaseState());

  Future<void> initPagination({required ActiveListParams params}) async {
    activeListParams = params;
    pagingController = PagingController<int, DeletionMemberModel>(
      getNextPageKey: (state) => state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (pageKey) async {
        final pageSize = activeListParams?.pageSize ?? 8;
        final response = await deletionRepository.fetchDeletionMembers(
          params: activeListParams!.copyWith(pageKey: pageKey),
        );


        final newModel = response.fold((failure) {
          throw Exception();
        }, (data) => data);
        final newItems = newModel.result ?? [];
        final oldModel = state.data;
        final combinedItems = [...?oldModel?.result, ...newItems];
        final updatedModel = newModel.copyWith(result: combinedItems);
        emit(state.copyWith(status: BaseStatus.success, data: updatedModel));
        pagingController.value = pagingController.value.copyWith(
          hasNextPage: false,
        );
        final isLastPage = newItems.length < pageSize;
      /*  if (isLastPage) {
          pagingController.value = pagingController.value.copyWith(
            hasNextPage: false,
          );
        }*/

        return newItems;
      },
    );
  }

  void fetchActiveList({required ActiveListParams params}) {
    activeListParams = params;
    pagingController.refresh();
    emit(state.copyWith(status: BaseStatus.success));
  }
}
