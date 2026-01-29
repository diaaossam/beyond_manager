import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/network/data/models/tiers_model.dart';
import 'package:bond/features/network/domain/repositories/network_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllTiersUseCase {
  final NetworkRepository repository;

  GetAllTiersUseCase(this.repository);

  Future<Either<Failure, TiersModel>> call({
    required int tpaId,
    required int companyId,
  }) async {
    return await repository.getAllTiers(tpaId: tpaId, companyId: companyId);
  }
}
