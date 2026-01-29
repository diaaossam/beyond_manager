import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/network/data/models/hospital_model.dart';
import 'package:bond/features/network/data/models/search_params.dart';
import 'package:bond/features/network/data/models/tiers_model.dart';
import 'package:bond/features/network/data/models/tpa_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkRemoteDataSource {
  Future<Either<Failure, List<TpaModel>>> getAllTpa();
  Future<Either<Failure, TiersModel>> getAllTiers({
    required int tpaId,
    required int companyId,
  });
  Future<Either<Failure, Map<String, dynamic>>> searchForTpa({
    required SearchParamsModel searchParamsModel,
  });
}

@LazySingleton(as: NetworkRemoteDataSource)
class NetworkRemoteDataSourceImpl implements NetworkRemoteDataSource {
  final DioConsumer dioConsumer;

  NetworkRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, List<TpaModel>>> getAllTpa() async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.tpa,
        method: 'GET',
      );
      final list = (response as List)
          .map((e) => TpaModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return Right(list);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }

  @override
  Future<Either<Failure, TiersModel>> getAllTiers({
    required int tpaId,
    required int companyId,
  }) async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.tires,
        method: 'GET',
        params: {
          "tpa": tpaId,
          "company": companyId,
        },
      );
      final tier = TiersModel.fromJson((response as List)[0] as Map<String, dynamic>);
      return Right(tier);
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> searchForTpa({
    required SearchParamsModel searchParamsModel,
  }) async {
    try {
      final response = await dioConsumer.performRequest(
        path: EndPoints.search,
        method: 'GET',
        params: searchParamsModel.toJson(),
      );
      
      final count = response['pagination']?['total_records'] ?? 0;
      final hospitals = (response['result'] as List)
          .map((e) => HospitalModel.fromJson(e as Map<String, dynamic>))
          .toList();
      
      return Right({
        'hospitals': hospitals,
        'count': count,
      });
    } catch (e) {
      return Left(ServerFailure(error: e.toString(), code: 0));
    }
  }
}
