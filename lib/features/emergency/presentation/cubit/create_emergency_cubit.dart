import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/emergency/data/models/emergency_params.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/helper/async_handler.dart';
import '../../data/repositories/emergency_repo_impl.dart';

@Injectable()
class CreateEmergencyCubit extends Cubit<BaseState<String>>
    with AsyncHandler<String> {
  final EmergencyRepositoryImpl emergencyRepositoryImpl;

  CreateEmergencyCubit(this.emergencyRepositoryImpl) : super(BaseState());

  Future<void> createEmergencyRequest({required EmergencyParams params}) async {
    handleAsync(
      call: () =>
          emergencyRepositoryImpl.createEmergencyRequest(params: params),
      onSuccess: (data) => data,
    );
  }
}
