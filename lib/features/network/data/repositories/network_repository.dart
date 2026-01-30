import 'package:bond/core/services/api/api_handler_mixin.dart';
import 'package:bond/features/network/data/models/response/hospital_model.dart';
import 'package:bond/features/network/data/models/response/pagination_model.dart';
import 'package:dartz/dartz.dart';
import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/core/services/network/internet_checker/netwok_info.dart';
import 'package:injectable/injectable.dart';
import '../datasources/network_remote_data_source.dart';
import '../models/response/search_params.dart';
import '../models/response/tiers_model.dart';
import '../models/response/tpa_model.dart';

@Injectable()
class NetworkRepositoryImpl with ApiHandlerMixin {
  final NetworkInfo networkInfo;
  final NetworkRemoteDataSource networkRemoteDataSource;

  NetworkRepositoryImpl({
    required this.networkInfo,
    required this.networkRemoteDataSource,
  });

  Future<Either<Failure, List<TpaModel>>> getAllTpa() async {
    return handleApi(() => networkRemoteDataSource.getAllTpa());
  }

  Future<Either<Failure, TiersModel>> getAllTiers({
    required int tpaId,
    required int companyId,
  }) async {
    return handleApi(
      () => networkRemoteDataSource.getAllTiers(
        tpaId: tpaId,
        companyId: companyId,
      ),
    );
  }

  Future<Either<Failure, HospitalResponseModel>> searchForTpa({
    required SearchParamsModel searchParamsModel,
  }) async {
    return handleApi(
      () => networkRemoteDataSource.searchForTpa(
        searchParamsModel: searchParamsModel,
      ),
    );
  }
}
