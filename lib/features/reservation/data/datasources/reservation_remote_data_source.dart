import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../../core/global_models/generic_model.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../../../../core/utils/api_config.dart';
import '../../../auth/data/datasources/auth_remote_data_source.dart';
import '../models/request/branches_params.dart';
import '../models/request/post_reservation_param.dart';
import '../models/request/speciality_params.dart';
import '../models/request/timeslot_params.dart';
import '../models/response/doctors_result.dart';
import '../models/response/hospitals_model.dart';
import '../models/response/my_reservation.dart';
import '../models/response/speciality_model.dart';

abstract class ReservationRemoteDataSource {
  Future<List<GenericModel>> getAllHospitals();

  Future<List<HospitalsModel>> getAllBranches({
    required BranchesParams branches,
  });

  Future<List<SpecialityModel>> getSpecialities({
    required SpecialityParams params,
  });

  Future<List<DoctorsResult>> getTimeSlot({
    required DoctorBookingParams params,
  });

  Future<Unit> reservation({required ReservationParams res});

  Future<List<MyReservation>> getReservation({required String status});
}

@LazySingleton(as: ReservationRemoteDataSource)
class ReservationRemoteDataSourceImpl implements ReservationRemoteDataSource {
  final DioConsumer dioConsumer;
  final AuthRemoteDataSource authRemoteDataSource;

  ReservationRemoteDataSourceImpl({
    required this.dioConsumer,
    required this.authRemoteDataSource,
  });

  @override
  Future<List<GenericModel>> getAllHospitals() async {
    return await dioConsumer
        .get(EndPoints.getHospitalsName)
        .factory((json) => GenericModel.fromJsonList(json['result']))
        .execute();
  }

  @override
  Future<List<HospitalsModel>> getAllBranches({
    required BranchesParams branches,
  }) async {
    return await dioConsumer.get(EndPoints.getHospitalsBranches).factory((
      json,
    ) {
      return HospitalsModel.fromJsonList(json['data']);
    }).execute();
  }

  @override
  Future<List<SpecialityModel>> getSpecialities({
    required SpecialityParams params,
  }) async {
    final data = await dioConsumer
        .get(EndPoints.getSpecialities)
        .params(params.toJson())
        .factory((json) => SpecialityModel.fromJsonList(json['data']))
        .execute();

    return data;
  }

  @override
  Future<List<DoctorsResult>> getTimeSlot({
    required DoctorBookingParams params,
  }) async {
    return await dioConsumer
        .get(EndPoints.timeslot)
        .params(params.toJson())
        .factory((json) => DoctorsResult.fromJsonList(json['data']))
        .execute();
  }

  @override
  Future<Unit> reservation({required ReservationParams res}) async {
    return await dioConsumer
        .get(EndPoints.appointment)
        .params(res.toJson())
        .factory((json) => unit)
        .execute();
  }

  @override
  Future<List<MyReservation>> getReservation({required String status}) async {
    return await dioConsumer
        .get(EndPoints.getMyAppointment)
        .params({"manager_id": ApiConfig.userId})
        .factory((json) => MyReservation.fromJsonList(json['result']))
        .execute();
  }
}
