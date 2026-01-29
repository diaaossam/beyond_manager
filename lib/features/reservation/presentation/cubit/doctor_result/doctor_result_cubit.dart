import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/async_handler.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/reservation/data/models/request/timeslot_params.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/domain/usecases/get_time_slot_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class DoctorResultCubit extends Cubit<BaseState<Map<String, dynamic>>>
    with AsyncHandler<Map<String, dynamic>> {
  final GetTimeSlotUseCase _getTimeSlotUseCase;

  DoctorResultCubit(this._getTimeSlotUseCase) : super(BaseState.initial());

  DoctorsResult? doctorsResult;
  Map<String, dynamic>? timeSlotData;

  void setDoctorResult(DoctorsResult result) {
    doctorsResult = result;
  }

  Future<void> getTimeSlot({required DoctorBookingParams params}) async {
    await handleAsync(
      call: () => _getTimeSlotUseCase(params: params),
      onSuccess: (data) {
        timeSlotData = data;
        return data;
      },
      identifier: 'get_timeslot',
    );
  }
}
