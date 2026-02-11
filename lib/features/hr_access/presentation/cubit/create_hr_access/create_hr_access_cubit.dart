import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/hr_access/data/repositories/hr_access_repository.dart';
import 'package:bond/features/policies/data/repositories/policies_repository_impl.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/helper/async_handler.dart';
import '../../../data/models/response/manager_form_data.dart';
import 'create_hr_access_data.dart';

@injectable
class CreateHrAccessCubit extends Cubit<BaseState<CreateHrAccessData>>
    with AsyncHandler<CreateHrAccessData> {
  final HrAccessRepository hrAccessRepository;
  final PoliciesRepositoryImpl policiesRepositoryImpl;

  CreateHrAccessCubit(this.hrAccessRepository, this.policiesRepositoryImpl)
    : super(BaseState()) {
    fetchPolicies();
  }

  Future<void> fetchPolicies() async {
    handleAsync(
      identifier: "policies",
      call: () => policiesRepositoryImpl.getCompanyPolicies(page: 1,state: "All"),
      onSuccess: (policies) =>
          (state.data ?? CreateHrAccessData()).copyWith(policies: policies),
    );
  }

  Future<void> submitManagers(List<ManagerFormData> managers) async {
    handleAsync(
      identifier: "submit_managers",
      call: () => hrAccessRepository.submitManagers(managers),
      onSuccess: (msg) =>
          (state.data ?? CreateHrAccessData()).copyWith(msg: msg),
    );
  }
}
