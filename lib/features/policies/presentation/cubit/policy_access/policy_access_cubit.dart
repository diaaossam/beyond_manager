import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/helper/async_handler.dart';
import '../../../data/models/response/policy_access_model.dart';

part 'policy_access_state.dart';

@injectable
class PolicyAccessCubit extends Cubit<BaseState<PolicyAccessModel>>
    with AsyncHandler<PolicyAccessModel> {
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  PolicyAccessCubit(this.policiesRepositoryImpl) : super(BaseState());

  Future<void> getPolicyAccess({required int policyId}) async {
    await handleAsync(
      call: () => policiesRepositoryImpl.getPolicyAccess(policyId: policyId),
      onSuccess: (data) => data,
    );
  }
}
