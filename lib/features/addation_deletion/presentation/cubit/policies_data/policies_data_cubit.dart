import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/addation_deletion/data/models/request/policies_data_params.dart';
import 'package:bond/features/addation_deletion/data/models/response/policies_data_addation.dart';
import 'package:bond/features/addation_deletion/data/repositories/addation_deletion_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/utils/app_strings.dart';

@Injectable()
class PoliciesDataCubit extends Cubit<BaseState<PoliciesDataAddation>> {
  final AddationDeletionRepository repository;

  PoliciesDataCubit(this.repository) : super(BaseState()) {
    pagingController = _buildPagingController();
  }

  late final PagingController<int, PoliciesDataModel> pagingController;

  PagingController<int, PoliciesDataModel> _buildPagingController() {
    late final PagingController<int, PoliciesDataModel> controller;
    controller = PagingController(
      getNextPageKey: (state) =>
          state.lastPageIsEmpty ? null : state.nextIntPageKey,
      fetchPage: (pageKey) async {
        final newItems = await _getPoliciesData(
          params: PoliciesDataParams(pageKey: pageKey),
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

  Future<List<PoliciesDataModel>> _getPoliciesData({
    required PoliciesDataParams params,
  }) async {
    final response = await repository.fetchPoliciesData(policies: params);
    return response.fold((l) => [], (r) => r.result ?? []);
  }
}
