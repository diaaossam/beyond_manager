import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/policies/data/models/policy_payment.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:bond/features/policies/data/models/get_active_list_params.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';

part 'policy_payment_state.dart';

@injectable
class PolicyPaymentCubit extends Cubit<BaseState<MainPolicyPayment>>
    with AsyncHandler<MainPolicyPayment> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  late final PagingController<int, PolicyPayment> pagingController;
  GetActiveListParams? _currentParams;

  PolicyPaymentCubit(this.policiesRepositoryImpl) : super(BaseState()) {
    pagingController = _buildPagingController();
  }

  Future<List<PolicyPayment>> _getPolicyPayment({
    required GetActiveListParams params,
  }) async {
    final response = await policiesRepositoryImpl.getPolicyPayment(
      getActiveListParams: params,
    );
    return response.fold(
      (l) => [],
      (r) => r.result ?? [],
    );
  }

  PagingController<int, PolicyPayment> _buildPagingController() {
    late final PagingController<int, PolicyPayment> controller;
    controller = PagingController(
      getNextPageKey: (state) => _nextIntPageKey(state, firstPageKey: 1),
      fetchPage: (pageKey) async {
        if (_currentParams == null) return [];
        
        final params = _currentParams!.copyWith(pageKey: pageKey);
        final newItems = await _getPolicyPayment(params: params);
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
    PagingState<int, PolicyPayment> state, {
    required int firstPageKey,
  }) {
    final keys = state.keys;
    if (keys == null || keys.isEmpty) {
      return firstPageKey;
    }
    return keys.last + 1;
  }

  void initPayment({required int policyId}) {
    _currentParams = GetActiveListParams(
      policyId: policyId,
      pageKey: 1,
      pageSize: pageSize,
    );
    pagingController.refresh();
  }
}
