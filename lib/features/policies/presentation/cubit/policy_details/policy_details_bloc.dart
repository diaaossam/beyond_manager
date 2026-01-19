import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/policies/data/models/policy_details.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:bond/features/policies/data/models/get_active_list_params.dart';
import 'package:injectable/injectable.dart';

part 'policy_details_state.dart';

@injectable
class PolicyDetailsCubit extends Cubit<BaseState<PolicyDetails>>
    with AsyncHandler<PolicyDetails> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  PolicyDetailsCubit(this.policiesRepositoryImpl) : super(BaseState());

  Future<void> getPolicyDetails({
    required GetActiveListParams getActiveListParams,
  }) async {
    await handleAsync(
      call: () => policiesRepositoryImpl.getPolicyDetails(
        getActiveListParams: getActiveListParams,
      ),
      onSuccess: (data) => data,
      identifier: 'get_policy_details',
    );
  }

  // For legacy file download support if needed
  PolicyDetails? get policyDetails => state.data;
}
