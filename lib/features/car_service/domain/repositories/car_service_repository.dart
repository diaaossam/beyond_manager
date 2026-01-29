import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/car_service/data/models/company_model.dart';
import 'package:bond/features/car_service/data/models/service_center_model.dart';
import 'package:bond/features/car_service/data/models/service_center_params.dart';
import 'package:dartz/dartz.dart';

abstract class CarServiceRepository {
  Future<Either<Failure, List<String>>> getVehicleBrand();
  Future<Either<Failure, List<CompanyModel>>> getInsuranceCompany();
  Future<Either<Failure, List<String>>> getServiceArea();
  Future<Either<Failure, List<String>>> getCenterType();
  Future<Either<Failure, List<ServiceCenterModel>>> getServiceCenters({
    required ServiceParams params,
  });
}
