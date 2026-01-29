import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/car_service/data/models/company_model.dart';
import 'package:bond/features/car_service/domain/repositories/car_service_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetInsuranceCompanyUseCase {
  final CarServiceRepository repository;

  GetInsuranceCompanyUseCase(this.repository);

  Future<Either<Failure, List<CompanyModel>>> call() async {
    return await repository.getInsuranceCompany();
  }
}
