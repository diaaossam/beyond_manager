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

abstract class ReservationRepository {
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
