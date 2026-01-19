import 'package:bond/features/emergency/data/models/emergency_model.dart';
import 'package:bond/features/emergency/data/models/emergency_params.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/api_handler_mixin.dart';
import '../../../../core/services/network/error/failures.dart';
import '../datasources/emergency_remote_data_source.dart';

@LazySingleton()
class EmergencyRepositoryImpl with ApiHandlerMixin {
  final EmergencyRemoteDataSource emergencyRemoteDataSource;

  EmergencyRepositoryImpl({required this.emergencyRemoteDataSource});

  Future<Either<Failure, String>> createEmergencyRequest({
    required EmergencyParams params,
  }) async {
    final response = await handleApi(
      () => emergencyRemoteDataSource.createEmergencyRequest(params: params),
    );
    return response;
  }

  Future<Either<Failure, List<EmergencyModel>>> getMyEmergencies({
    required int page,
  }) async {
    final response = await handleApi(
      () => emergencyRemoteDataSource.getMyEmergencies(page: page),
    );
    return response;
  }
}
