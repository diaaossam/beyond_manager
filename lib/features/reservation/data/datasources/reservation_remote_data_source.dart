import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:bond/core/services/network/error/failures.dart';
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
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class ReservationRemoteDataSource {
  Future<Either<Failure, List<HospitalsModel>>> getAllHospitals();
  Future<Either<Failure, List<BranchModel>>> getAllBranches({
    required BranchesParams branches,
  });
  Future<Either<Failure, List<SpecialityModel>>> getSpecialities({
    required SpecialityParams params,
  });
  Future<Either<Failure, DoctorsResult>> searchForDoctors({
    required SearchDoctorParams search,
  });
  Future<Either<Failure, Map<String, dynamic>>> getTimeSlot({
    required DoctorBookingParams params,
  });
  Future<Either<Failure, Map<String, dynamic>>> reservation({
    required ReservationParams res,
  });
  Future<Either<Failure, List<MyReservation>>> getReservation({
    required String status,
  });
}

@LazySingleton(as: ReservationRemoteDataSource)
class ReservationRemoteDataSourceImpl implements ReservationRemoteDataSource {
  final DioConsumer dioConsumer;

  ReservationRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, List<HospitalsModel>>> getAllHospitals() async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.getHospitalsName,
        method: 'GET',
      );
      final list = response as List;
      final hospitals = list
          .map((e) => HospitalsModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(hospitals);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }

  @override
  Future<Either<Failure, List<BranchModel>>> getAllBranches({
    required BranchesParams branches,
  }) async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.getHospitals,
        method: 'GET',
        params: branches.toJson(),
      );
      final list = response as List;
      final branchList = list
          .map((e) => BranchModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(branchList);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }

  @override
  Future<Either<Failure, List<SpecialityModel>>> getSpecialities({
    required SpecialityParams params,
  }) async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.getSpecialities,
        method: 'GET',
        params: params.toJson(),
      );
      final list = response as List;
      final specialities = list
          .map((e) => SpecialityModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(specialities);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }

  @override
  Future<Either<Failure, DoctorsResult>> searchForDoctors({
    required SearchDoctorParams search,
  }) async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.searchForDoctors,
        method: 'GET',
        params: search.toJson(),
      );
      final result = DoctorsResult.fromJson(response as Map<String, dynamic>);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getTimeSlot({
    required DoctorBookingParams params,
  }) async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.getTimeslot,
        method: 'GET',
        params: params.toJson(),
      );
      return Right(response as Map<String, dynamic>);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> reservation({
    required ReservationParams res,
  }) async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.postReservation,
        method: 'POST',
        data: res.toJson(),
      );
      return Right(response as Map<String, dynamic>);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }

  @override
  Future<Either<Failure, List<MyReservation>>> getReservation({
    required String status,
  }) async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.getReservation,
        method: 'GET',
        params: {'status': status},
      );
      final list = response as List;
      final reservations = list
          .map((e) => MyReservation.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(reservations);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }
}
