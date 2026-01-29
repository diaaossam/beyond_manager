import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/car_service/data/models/company_model.dart';
import 'package:bond/features/car_service/data/models/service_center_model.dart';
import 'package:bond/features/car_service/data/models/service_center_params.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class CarServiceRemoteDataSource {
  Future<Either<Failure, List<String>>> getVehicleBrand();
  Future<Either<Failure, List<CompanyModel>>> getInsuranceCompany();
  Future<Either<Failure, List<String>>> getServiceArea();
  Future<Either<Failure, List<String>>> getCenterTypeArea();
  Future<Either<Failure, List<ServiceCenterModel>>> getServiceCenters({
    required ServiceParams params,
  });
}

@LazySingleton(as: CarServiceRemoteDataSource)
class CarServiceRemoteDataSourceImpl implements CarServiceRemoteDataSource {
  final DioConsumer dioConsumer;

  CarServiceRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, List<CompanyModel>>> getInsuranceCompany() async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.insuranceCompany,
        method: 'GET',
      );
      final list = (response['options'] as List)
          .map((e) => CompanyModel.fromJson(map: e as Map<String, dynamic>))
          .toList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getVehicleBrand() async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.vehicleBrand,
        method: 'GET',
      );
      final list = (response['options'] as List).cast<String>();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getServiceArea() async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.area,
        method: 'GET',
      );
      final list = (response['options'] as List).cast<String>();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCenterTypeArea() async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.centerType,
        method: 'GET',
      );
      final list = (response['options'] as List).cast<String>();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }

  @override
  Future<Either<Failure, List<ServiceCenterModel>>> getServiceCenters({
    required ServiceParams params,
  }) async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.serviceCenters,
        method: 'GET',
        params: params.toJson(),
      );
      final list = (response['result'] as List)
          .map((e) => ServiceCenterModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }
}
