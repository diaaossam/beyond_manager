import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/network/data/datasources/network_remote_data_source.dart';
import 'package:bond/features/network/data/models/search_params.dart';
import 'package:bond/features/network/data/models/tiers_model.dart';
import 'package:bond/features/network/data/models/tpa_model.dart';
import 'package:bond/features/network/domain/repositories/network_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: NetworkRepository)
class NetworkRepositoryImpl implements NetworkRepository {
  final NetworkRemoteDataSource networkRemoteDataSource;

  NetworkRepositoryImpl({required this.networkRemoteDataSource});

  @override
  Future<Either<Failure, List<TpaModel>>> getAllTpa() async {
    return await networkRemoteDataSource.getAllTpa();
  }

  @override
  Future<Either<Failure, TiersModel>> getAllTiers({
    required int tpaId,
    required int companyId,
  }) async {
    return await networkRemoteDataSource.getAllTiers(
      tpaId: tpaId,
      companyId: companyId,
    );
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> searchForTpa({
    required SearchParamsModel searchParamsModel,
  }) async {
    return await networkRemoteDataSource.searchForTpa(
      searchParamsModel: searchParamsModel,
    );
  }
}
