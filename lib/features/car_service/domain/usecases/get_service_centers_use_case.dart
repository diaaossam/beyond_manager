import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/car_service/data/models/service_center_model.dart';
import 'package:bond/features/car_service/data/models/service_center_params.dart';
import 'package:bond/features/car_service/domain/repositories/car_service_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetServiceCentersUseCase {
  final CarServiceRepository repository;

  GetServiceCentersUseCase(this.repository);

  Future<Either<Failure, List<ServiceCenterModel>>> call({
    required ServiceParams params,
  }) async {
    return await repository.getServiceCenters(params: params);
  }
}
