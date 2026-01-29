import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/network/data/models/search_params.dart';
import 'package:bond/features/network/data/models/tiers_model.dart';
import 'package:bond/features/network/data/models/tpa_model.dart';
import 'package:dartz/dartz.dart';

abstract class NetworkRepository {
  Future<Either<Failure, List<TpaModel>>> getAllTpa();
  Future<Either<Failure, TiersModel>> getAllTiers({
    required int tpaId,
    required int companyId,
  });
  Future<Either<Failure, Map<String, dynamic>>> searchForTpa({
    required SearchParamsModel searchParamsModel,
  });
}
