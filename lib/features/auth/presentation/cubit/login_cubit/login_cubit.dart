import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/auth/presentation/cubit/login_cubit/login_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/helper/async_handler.dart';
import '../../../data/models/request/login_params.dart';
import '../../../data/repositories/auth_repo_impl.dart';

@injectable
class LoginCubit extends Cubit<BaseState<LoginData>>
    with AsyncHandler<LoginData> {
  final AuthRepository authRepositoryImpl;

  LoginCubit(this.authRepositoryImpl)
    : super(BaseState(data: LoginData(phoneNumber: "")));

  Future<void> login({required LoginParams loginParams}) async {
    await handleAsync(
      call: () => authRepositoryImpl.loginUser(loginParams: loginParams),
      onSuccess: (data) => state.data!.copyWith(userModel: data),
    );
  }

  void onChangePhoneNumber(String phoneNumber) {
    emit(state.copyWith(data: state.data?.copyWith(phoneNumber: phoneNumber)));
  }
}
