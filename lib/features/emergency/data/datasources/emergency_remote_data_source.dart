import 'package:bond/core/services/api/end_points.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/emergency/data/models/emergency_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/api/dio_consumer.dart';
import '../models/emergency_params.dart';

abstract class EmergencyRemoteDataSource {
  Future<String> createEmergencyRequest({required EmergencyParams params});

  Future<List<EmergencyModel>> getMyEmergencies({required int page});
}

@Injectable(as: EmergencyRemoteDataSource)
class EmergencyRemoteDataSourceImpl implements EmergencyRemoteDataSource {
  final DioConsumer dioConsumer;

  EmergencyRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<String> createEmergencyRequest({
    required EmergencyParams params,
  }) async {
    return await dioConsumer
        .post(EndPoints.postEmergency)
        .params(params.toJson())
        .factory((json) => '')
        .execute();
  }

  @override
  Future<List<EmergencyModel>> getMyEmergencies({required int page}) async {
    return await dioConsumer
        .get(EndPoints.myEmergency)
        .params({"page_number": page, "page_size": pageSize})
        .factory((json) {
          if (json['result'] == null ) {
            return  <EmergencyModel>[];
          }
          return json['result']
              .map<EmergencyModel>(
                (element) => EmergencyModel.fromJson(element),
              )
              .toList();
        })
        .execute();
  }
}
