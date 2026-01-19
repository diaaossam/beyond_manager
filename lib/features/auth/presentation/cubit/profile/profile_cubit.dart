import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/auth/data/models/response/user_model.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
import 'package:bond/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class ProfileCubit extends Cubit<BaseState<UserModel>>
    with AsyncHandler<UserModel> {
  final AuthRepository authRepository;

  ProfileCubit(this.authRepository)
    : super(BaseState(data: UserDataService().getUserData()));

  Future<void> updateCompany({required num id}) async {
    handleAsync(
      identifier: "update_company",
      call: () => authRepository.updateCompany(id: id),
      onSuccess: (data) => UserDataService().getUserData()!,
    );
  }
}
