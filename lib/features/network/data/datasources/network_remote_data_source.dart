import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:injectable/injectable.dart';
import '../models/response/hospital_model.dart';
import '../models/response/search_params.dart';
import '../models/response/tiers_model.dart';
import '../models/response/tpa_model.dart';

abstract class NetworkRemoteDataSource {
  Future<List<TpaModel>> getAllTpa();

  Future<TiersModel> getAllTiers({required int tpaId, required int companyId});

  Future<HospitalResponseModel> searchForTpa({
    required SearchParamsModel searchParamsModel,
  });
}

@Injectable(as: NetworkRemoteDataSource)
class NetworkRemoteDataSourceImpl implements NetworkRemoteDataSource {
  final DioConsumer dioConsumer;

  NetworkRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<TpaModel>> getAllTpa() async {
    return await dioConsumer
        .get(EndPoints.tpa)
        .factory((json) => TpaModel.fromJsonList(json['result']))
        .execute();
  }

  @override
  Future<TiersModel> getAllTiers({
    required int tpaId,
    required int companyId,
  }) async {
    return await dioConsumer
        .get(EndPoints.tires)
        .params({"tpa": tpaId.toString(), "company": companyId.toString()})
        .factory((json) => TiersModel.fromJson(json['result'][0]))
        .execute();
  }

  @override
  Future<HospitalResponseModel> searchForTpa({
    required SearchParamsModel searchParamsModel,
  }) async {
    return await dioConsumer
        .get(EndPoints.search)
        .params(searchParamsModel.toJson())
        .factory((json) => HospitalResponseModel.fromJson(json: json))
        .execute();
  }
}
