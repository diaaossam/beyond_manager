import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/reservation/data/datasources/reservation_remote_data_source.dart';
import 'package:bond/features/reservation/data/models/request/branches_params.dart';
import 'package:bond/features/reservation/data/models/request/post_reservation_param.dart';
import 'package:bond/features/reservation/data/models/request/search_doctor_params.dart';
import 'package:bond/features/reservation/data/models/request/speciality_params.dart';
import 'package:bond/features/reservation/data/models/request/timeslot_params.dart';
import 'package:bond/features/reservation/data/models/response/branch_model.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/data/models/response/hospitals_model.dart';
import 'package:bond/features/reservation/data/models/response/my_reservation.dart';
import 'package:bond/features/reservation/data/models/response/speciality_model.dart';
import 'package:bond/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ReservationRepository)
class ReservationRepositoryImpl implements ReservationRepository {
  final ReservationRemoteDataSource remoteDataSource;

  ReservationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<HospitalsModel>>> getAllHospitals() async {
    return await remoteDataSource.getAllHospitals();
  }

  @override
  Future<Either<Failure, List<BranchModel>>> getAllBranches({
    required BranchesParams branches,
  }) async {
    return await remoteDataSource.getAllBranches(branches: branches);
  }

  @override
  Future<Either<Failure, List<SpecialityModel>>> getSpecialities({
    required SpecialityParams params,
  }) async {
    return await remoteDataSource.getSpecialities(params: params);
  }

  @override
  Future<Either<Failure, DoctorsResult>> searchForDoctors({
    required SearchDoctorParams search,
  }) async {
    return await remoteDataSource.searchForDoctors(search: search);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getTimeSlot({
    required DoctorBookingParams params,
  }) async {
    return await remoteDataSource.getTimeSlot(params: params);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> reservation({
    required ReservationParams res,
  }) async {
    return await remoteDataSource.reservation(res: res);
  }

  @override
  Future<Either<Failure, List<MyReservation>>> getReservation({
    required String status,
  }) async {
    return await remoteDataSource.getReservation(status: status);
  }
}
