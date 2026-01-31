import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/async_handler.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/reservation/data/models/request/timeslot_params.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/data/repositories/reservation_repository_impl.dart';
import 'package:injectable/injectable.dart';

class DoctorResultData {
  final List<DoctorsResult> allTimeSlots;
  final List<DoctorsResult> filteredTimeSlots;
  final DoctorBookingParams? lastParams;

  DoctorResultData({
    this.allTimeSlots = const [],
    this.filteredTimeSlots = const [],
    this.lastParams,
  });

  DoctorResultData copyWith({
    List<DoctorsResult>? allTimeSlots,
    List<DoctorsResult>? filteredTimeSlots,
    DoctorBookingParams? lastParams,
  }) {
    return DoctorResultData(
      allTimeSlots: allTimeSlots ?? this.allTimeSlots,
      filteredTimeSlots: filteredTimeSlots ?? this.filteredTimeSlots,
      lastParams: lastParams ?? this.lastParams,
    );
  }
}

@injectable
class DoctorResultCubit extends Cubit<BaseState<DoctorResultData>>
    with AsyncHandler<DoctorResultData> {
  final ReservationRepositoryImpl reservationRepositoryImpl;

  DoctorResultCubit(this.reservationRepositoryImpl)
      : super(BaseState.initial(data: DoctorResultData()));

  void setAllTimeSlot(List<DoctorsResult> allTimeSlots) {
    emit(state.copyWith(
      status: BaseStatus.success,
      data: state.data!.copyWith(
        allTimeSlots: allTimeSlots,
        filteredTimeSlots: allTimeSlots,
      ),
      identifier: 'set_timeslots',
    ));
  }

  Future<void> getAllTimeSlot({
    required DoctorBookingParams params,
  }) async {
    await handleAsync(
      call: () => reservationRepositoryImpl.getTimeSlot(params: params),
      onSuccess: (timeSlots) => state.data!.copyWith(
        allTimeSlots: timeSlots,
        filteredTimeSlots: timeSlots,
        lastParams: params,
      ),
      identifier: 'get_timeslot',
    );
  }

  void filterDoctors(String query) {
    final filtered = state.data!.allTimeSlots.where((doctor) {
      final name = doctor.nomInterv?.toLowerCase() ?? "";
      final nameAr = doctor.nomIntervAr?.toLowerCase() ?? "";
      final specialty = doctor.designationSpecialite?.toLowerCase() ?? "";
      final specialtyAr = doctor.designationSpecialiteAr?.toLowerCase() ?? "";
      return name.contains(query.toLowerCase()) ||
          nameAr.contains(query.toLowerCase()) ||
          specialtyAr.contains(query.toLowerCase()) ||
          specialty.contains(query.toLowerCase());
    }).toList();

    emit(state.copyWith(
      data: state.data!.copyWith(filteredTimeSlots: filtered),
      identifier: 'filter_doctors',
    ));
  }
}
