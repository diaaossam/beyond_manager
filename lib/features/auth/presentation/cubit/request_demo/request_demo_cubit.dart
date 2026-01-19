import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/request/request_demo_params.dart';

@Injectable()
class RequestDemoCubit extends Cubit<BaseState<String>>
    with AsyncHandler<String> {
  final AuthRepository authRepository;

  RequestDemoCubit(this.authRepository) : super(BaseState());

  Future<void> requestDemo({required RequestDemoParams params}) async {
     handleAsync(
      call: () => authRepository.requestDemo(params: params),
      onSuccess: (data) => data,
    );
  }
}
