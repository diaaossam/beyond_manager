import 'package:injectable/injectable.dart';

import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../models/company_model.dart';
import '../models/service_center_model.dart';
import '../models/service_center_params.dart';

abstract class CarServiceRemoteDataSource {
  Future<List<String>> getVehicleBrand();

  Future<List<CompanyModel>> getInsuranceCompany();

  Future<List<String>> getServiceArea();

  Future<List<String>> getCenterType();

  Future<List<ServiceCenterModel>> getServiceCenters({
    required ServiceParams params,
  });
}

@LazySingleton(as: CarServiceRemoteDataSource)
class CarServiceRemoteDataSourceImpl implements CarServiceRemoteDataSource {
  final DioConsumer dioConsumer;

  CarServiceRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<CompanyModel>> getInsuranceCompany() async {
    return await dioConsumer
        .get(EndPoints.insuranceCompany)
        .factory((json) => CompanyModel.fromJsonList(json['options']))
        .execute();
  }

  @override
  Future<List<String>> getVehicleBrand() async {
    return await dioConsumer
        .get(EndPoints.vehicleBrand)
        .factory((json) => (json['options'] as List).cast<String>())
        .execute();
  }

  @override
  Future<List<String>> getServiceArea() async {
    return await dioConsumer
        .get(EndPoints.area)
        .factory((json) => (json['options'] as List).cast<String>())
        .execute();
  }

  @override
  Future<List<String>> getCenterType() async {
    return await dioConsumer
        .get(EndPoints.centerType)
        .factory((json) => (json['options'] as List).cast<String>())
        .execute();
  }

  @override
  Future<List<ServiceCenterModel>> getServiceCenters({
    required ServiceParams params,
  }) async {
    return await dioConsumer
        .get(EndPoints.serviceCenters)
        .params(params.toJson())
        .factory((json) => ServiceCenterModel.fromJsonList(json['result']))
        .execute();
  }
}
