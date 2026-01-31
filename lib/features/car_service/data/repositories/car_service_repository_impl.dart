import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/api/api_handler_mixin.dart';
import '../../../../core/services/network/error/failures.dart';
import '../datasources/car_service_remote_data_source.dart';
import '../models/company_model.dart';
import '../models/service_center_model.dart';
import '../models/service_center_params.dart';

@LazySingleton()
class CarServiceRepositoryImpl with ApiHandlerMixin {
  final CarServiceRemoteDataSource remoteDataSource;

  CarServiceRepositoryImpl({required this.remoteDataSource});

  Future<Either<Failure, List<String>>> getVehicleBrand() async {
    return handleApi(() async => await remoteDataSource.getVehicleBrand());
  }

  Future<Either<Failure, List<CompanyModel>>> getInsuranceCompany() async {
    return handleApi(() async => await remoteDataSource.getInsuranceCompany());
  }

  Future<Either<Failure, List<String>>> getServiceArea() async {
    return handleApi(() async => await remoteDataSource.getServiceArea());
  }

  Future<Either<Failure, List<String>>> getCenterType() async {
    return handleApi(() async => await remoteDataSource.getCenterType());
  }

  Future<Either<Failure, List<ServiceCenterModel>>> getServiceCenters({
    required ServiceParams params,
  }) async {
    return handleApi(
      () async => await remoteDataSource.getServiceCenters(params: params),
    );
  }
}
