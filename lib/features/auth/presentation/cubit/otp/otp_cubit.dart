import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/helper/async_handler.dart';
import '../../../data/models/request/otp_params.dart';

@injectable
class OtpCubit extends Cubit<BaseState<String>> with AsyncHandler<String> {
  final AuthRepository authRepositoryImpl;

  OtpCubit(this.authRepositoryImpl) : super(BaseState());

  Future<void> sendOtp({
    required String phone,
    required bool isWhatsApp,
  }) async {
    handleAsync(
      call: () =>
          authRepositoryImpl.sendOtp(phone: phone, isWhatsApp: isWhatsApp),
      identifier: 'sendOtp',
      onSuccess: (data) => data,
    );
  }

  Future<void> verifyOtp({required OtpParams params}) async {
    handleAsync(
      call: () => authRepositoryImpl.verifyOtp(params: params),
      identifier: 'verifyOtp',
      onSuccess: (data) => state.data ?? "",
    );
  }
}
