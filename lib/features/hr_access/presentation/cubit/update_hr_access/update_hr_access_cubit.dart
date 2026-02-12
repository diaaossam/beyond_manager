import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/hr_access/data/models/response/policy_access_item.dart';
import 'package:bond/features/hr_access/data/repositories/hr_access_repository.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/helper/async_handler.dart';
import 'update_hr_access_data.dart';

@injectable
class UpdateHrAccessCubit extends Cubit<BaseState<UpdateHrAccessData>>
    with AsyncHandler<UpdateHrAccessData> {
  final HrAccessRepository hrAccessRepository;
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  UpdateHrAccessCubit(this.hrAccessRepository, this.policiesRepositoryImpl)
      : super(BaseState()) {
    fetchManagers();
    fetchPolicies();
  }

  Future<void> fetchManagers() async {
    handleAsync(
      identifier: "managers",
      call: () => hrAccessRepository.getManagers(),
      onSuccess: (managers) =>
          (state.data ?? UpdateHrAccessData()).copyWith(managers: managers),
    );
  }

  Future<void> fetchPolicies() async {
    handleAsync(
      identifier: "policies",
      call: () => policiesRepositoryImpl.getCompanyPolicies(page: 1, state: 'active'),
      onSuccess: (policies) =>
          (state.data ?? UpdateHrAccessData()).copyWith(policies: policies),
    );
  }

  Future<void> updateManager({
    required num managerId,
    required String name,
    required bool reimbursement,
    required List<PolicyAccessItem> policies,
  }) async {
    handleAsync(
      identifier: "update_manager",
      call: () => hrAccessRepository.updateManager(
        managerId: managerId,
        name: name,
        reimbursement: reimbursement,
        policies: policies,
      ),
      onSuccess: (msg) =>
          (state.data ?? UpdateHrAccessData()).copyWith(msg: msg),
    );
  }
}
