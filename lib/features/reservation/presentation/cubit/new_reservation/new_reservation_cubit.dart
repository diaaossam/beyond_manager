import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/async_handler.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/reservation/data/models/request/branches_params.dart';
import 'package:bond/features/reservation/data/models/request/speciality_params.dart';
import 'package:bond/features/reservation/data/models/request/timeslot_params.dart';
import 'package:bond/features/reservation/data/models/response/branch_model.dart';
import 'package:bond/features/reservation/data/models/response/hospitals_model.dart';
import 'package:bond/features/reservation/data/models/response/speciality_model.dart';
import 'package:bond/features/reservation/domain/usecases/get_all_branches_use_case.dart';
import 'package:bond/features/reservation/domain/usecases/get_all_hospitals_use_case.dart';
import 'package:bond/features/reservation/domain/usecases/get_all_specialty_use_case.dart';
import 'package:bond/features/reservation/domain/usecases/get_time_slot_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class NewReservationCubit extends Cubit<BaseState<dynamic>>
    with AsyncHandler<dynamic> {
  final GetAllHospitalsUseCase _getAllHospitalsUseCase;
  final GetAllBranchesUseCase _getAllBranchesUseCase;
  final GetAllSpecialityUseCase _getAllSpecialityUseCase;
  final GetTimeSlotUseCase _getTimeSlotUseCase;

  NewReservationCubit(
    this._getAllHospitalsUseCase,
    this._getAllBranchesUseCase,
    this._getAllSpecialityUseCase,
    this._getTimeSlotUseCase,
  ) : super(BaseState.initial()) {
    getAllBranches(params: BranchesParams());
  }

  List<HospitalsModel> allHospitals = [];
  List<BranchModel> allBranches = [];
  List<SpecialityModel> allSpecialities = [];
  Map<String, dynamic>? timeSlotData;

  Future<void> getAllHospitals() async {
    await handleAsync(
      call: () => _getAllHospitalsUseCase(),
      onSuccess: (data) {
        allHospitals = data;
        return data;
      },
      identifier: 'get_hospitals',
    );
  }

  Future<void> getAllBranches({required BranchesParams params}) async {
    await handleAsync(
      call: () => _getAllBranchesUseCase(branches: params),
      onSuccess: (data) {
        allBranches = data;
        return data;
      },
      identifier: 'get_branches',
    );
  }

  Future<void> getAllSpeciality({
    required SpecialityParams specialityParams,
  }) async {
    await handleAsync(
      call: () => _getAllSpecialityUseCase(params: specialityParams),
      onSuccess: (data) {
        allSpecialities = data;
        return data;
      },
      identifier: 'get_specialities',
    );
  }

  Future<void> getTimeSlot({
    required DoctorBookingParams params,
  }) async {
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
