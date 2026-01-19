import 'package:bloc/bloc.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/policies/data/models/main_policy_model.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

part 'policies_state.dart';

@injectable
class PoliciesCubit extends Cubit<PoliciesState> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;
  
  late final PagingController<int, MainPolicyModel> pagingController;
  String currentState = "All";

  PoliciesCubit(this.policiesRepositoryImpl) : super(PoliciesState()) {
    pagingController = _buildPagingController();
  }

  Future<List<MainPolicyModel>> _getCompanyPolicies({
    required int page,
    required String state,
  }) async {
    final response = await policiesRepositoryImpl.getCompanyPolicies(
      page: page,
      state: state,
    );
    return response.fold((l) => [], (r) => r);
  }

  PagingController<int, MainPolicyModel> _buildPagingController() {
    late final PagingController<int, MainPolicyModel> controller;
    controller = PagingController(
      getNextPageKey: (state) => _nextIntPageKey(state, firstPageKey: 1),
      fetchPage: (pageKey) async {
        final newItems = await _getCompanyPolicies(
          page: pageKey,
          state: currentState,
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
    final keys = state.keys;
    if (keys == null || keys.isEmpty) {
      return firstPageKey;
    }
    return keys.last + 1;
  }

  void changeState(String state) {
    currentState = state;
    pagingController.refresh();
    emit(PoliciesState(selectedState: state));
  }
}
