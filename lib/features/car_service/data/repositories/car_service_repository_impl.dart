import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/car_service/data/datasources/car_service_remote_data_source.dart';
import 'package:bond/features/car_service/data/models/company_model.dart';
import 'package:bond/features/car_service/data/models/service_center_model.dart';
import 'package:bond/features/car_service/data/models/service_center_params.dart';
import 'package:bond/features/car_service/domain/repositories/car_service_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CarServiceRepository)
class CarServiceRepositoryImpl implements CarServiceRepository {
  final CarServiceRemoteDataSource carServiceRemoteDataSource;

  CarServiceRepositoryImpl({required this.carServiceRemoteDataSource});

  @override
  Future<Either<Failure, List<String>>> getVehicleBrand() async {
    return await carServiceRemoteDataSource.getVehicleBrand();
  }

  @override
  Future<Either<Failure, List<CompanyModel>>> getInsuranceCompany() async {
    return await carServiceRemoteDataSource.getInsuranceCompany();
  }

  @override
  Future<Either<Failure, List<String>>> getServiceArea() async {
    return await carServiceRemoteDataSource.getServiceArea();
  }

  @override
  Future<Either<Failure, List<String>>> getCenterType() async {
    return await carServiceRemoteDataSource.getCenterTypeArea();
  }

  @override
  Future<Either<Failure, List<ServiceCenterModel>>> getServiceCenters({
    required ServiceParams params,
  }) async {
    return await carServiceRemoteDataSource.getServiceCenters(params: params);
  }
}
