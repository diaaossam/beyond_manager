import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/async_handler.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/reservation/data/models/request/branches_params.dart';
import 'package:bond/features/reservation/data/models/request/speciality_params.dart';
import 'package:bond/features/reservation/data/models/request/timeslot_params.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/data/models/response/hospitals_model.dart';
import 'package:bond/features/reservation/data/models/response/speciality_model.dart';
import 'package:bond/features/reservation/data/repositories/reservation_repository_impl.dart';
import 'package:injectable/injectable.dart';

class NewReservationData {
  final List<GenericModel> hospitals;
  final List<HospitalsModel> branches;
  final List<SpecialityModel> specialities;
  final List<DoctorsResult> timeSlots;
  final DoctorBookingParams? lastParams;
  final bool shouldNavigate;

  NewReservationData({
    this.hospitals = const [],
    this.branches = const [],
    this.specialities = const [],
    this.timeSlots = const [],
    this.lastParams,
    this.shouldNavigate = false,
  });

  NewReservationData copyWith({
    List<GenericModel>? hospitals,
    List<HospitalsModel>? branches,
    List<SpecialityModel>? specialities,
    List<DoctorsResult>? timeSlots,
    DoctorBookingParams? lastParams,
    bool? shouldNavigate,
  }) {
    return NewReservationData(
      hospitals: hospitals ?? this.hospitals,
      branches: branches ?? this.branches,
      specialities: specialities ?? this.specialities,
      timeSlots: timeSlots ?? this.timeSlots,
      lastParams: lastParams ?? this.lastParams,
      shouldNavigate: shouldNavigate ?? this.shouldNavigate,
    );
  }
}

@injectable
class NewReservationCubit extends Cubit<BaseState<NewReservationData>>
    with AsyncHandler<NewReservationData> {
  final ReservationRepositoryImpl reservationRepositoryImpl;

  NewReservationCubit(this.reservationRepositoryImpl)
      : super(BaseState.initial(data: NewReservationData())) {
    getAllBranches(params: BranchesParams());
  }

  Future<void> getAllHospitals() async {
    await handleAsync(
      call: () => reservationRepositoryImpl.getAllHospitals(),
      onSuccess: (hospitals) =>
          state.data!.copyWith(hospitals: hospitals),
      identifier: 'get_hospitals',
    );
  }

  Future<void> getAllBranches({required BranchesParams params}) async {
    await handleAsync(
      call: () => reservationRepositoryImpl.getAllBranches(branches: params),
      onSuccess: (branches) =>
          state.data!.copyWith(branches: branches),
      identifier: 'get_branches',
    );
  }

  Future<void> getAllSpeciality({
    required SpecialityParams specialityParams,
  }) async {
    await handleAsync(
      call: () =>
          reservationRepositoryImpl.getSpecialities(params: specialityParams),
      onSuccess: (specialities) =>
          state.data!.copyWith(specialities: specialities),
      identifier: 'get_specialities',
    );
  }

  Future<void> getAllTimeSlot({
    required DoctorBookingParams params,
    required bool isNavigate,
    required bool isFilter,
    List<DoctorsResult>? list,
  }) async {
    if (isFilter) {
      if (list == null || list.isEmpty) {
        emit(state.copyWith(
          status: BaseStatus.failure,
          identifier: 'get_timeslot',
        ));
        return;
      }

      final filteredList = list.where((doctor) {
        final date = DateTime.tryParse(doctor.jourLocalDateTime ?? "");
        if (date == null || params.startDate == null || params.endDate == null) {
          return false;
        }

        final startDate = DateTime.parse(params.startDate!);
        final endDate = DateTime.parse(params.endDate!);

        return (date.isAtSameMomentAs(startDate) || date.isAfter(startDate)) &&
            (date.isAtSameMomentAs(endDate) || date.isBefore(endDate));
      }).toList();

      emit(state.copyWith(
        status: BaseStatus.success,
        data: state.data!.copyWith(
          timeSlots: filteredList,
          lastParams: params,
          shouldNavigate: isNavigate,
        ),
        identifier: 'get_timeslot',
      ));
    } else {
      await handleAsync(
        call: () => reservationRepositoryImpl.getTimeSlot(params: params),
        onSuccess: (timeSlots) => state.data!.copyWith(
          timeSlots: timeSlots,
          lastParams: params,
          shouldNavigate: isNavigate,
        ),
        identifier: 'get_timeslot',
      );
    }
  }
}
