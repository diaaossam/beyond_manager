import 'package:bond/core/services/api/api_handler_mixin.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/global_models/generic_model.dart';
import '../../../../core/services/network/error/failures.dart';
import '../datasources/reservation_remote_data_source.dart';
import '../models/request/branches_params.dart';
import '../models/request/post_reservation_param.dart';
import '../models/request/speciality_params.dart';
import '../models/request/timeslot_params.dart';
import '../models/response/doctors_result.dart';
import '../models/response/hospitals_model.dart';
import '../models/response/my_reservation.dart';
import '../models/response/speciality_model.dart';
@LazySingleton()
class ReservationRepositoryImpl with ApiHandlerMixin {
  final ReservationRemoteDataSource remoteDataSource;

  ReservationRepositoryImpl({required this.remoteDataSource});

  Future<Either<Failure, List<GenericModel>>> getAllHospitals() async {
    return handleApi(() async => await remoteDataSource.getAllHospitals());
  }

  Future<Either<Failure, List<HospitalsModel>>> getAllBranches({
    required BranchesParams branches,
  }) async {
    return handleApi(
      () async => await remoteDataSource.getAllBranches(branches: branches),
    );
  }

  Future<Either<Failure, List<SpecialityModel>>> getSpecialities({
    required SpecialityParams params,
  }) async {
    return handleApi(
      () async => await remoteDataSource.getSpecialities(params: params),
    );
  }

  Future<Either<Failure, List<DoctorsResult>>> getTimeSlot({
    required DoctorBookingParams params,
  }) async {
    return handleApi(
      () async => await remoteDataSource.getTimeSlot(params: params),
    );
  }

  Future<Either<Failure, Unit>> reservation({
    required ReservationParams res,
  }) async {
    return handleApi(() async => await remoteDataSource.reservation(res: res));
  }

  Future<Either<Failure, List<MyReservation>>> getReservation({
    required String status,
  }) async {
    return handleApi(
      () async => await remoteDataSource.getReservation(status: status),
    );
  }
}
