import 'package:injectable/injectable.dart';

import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../models/response/manager_form_data.dart';

abstract class HrAccessRemoteDataSource {
  Future<String> createHrAccess(List<ManagerFormData> managers);
}

@LazySingleton(as: HrAccessRemoteDataSource)
class HrAccessRemoteDataSourceImpl implements HrAccessRemoteDataSource {
  final DioConsumer dioConsumer;

  HrAccessRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<String> createHrAccess(List<ManagerFormData> managers) async {
    final body = {
      'managers': managers.map((m) => m.toJson()).toList(),
    };
    return await dioConsumer
        .post(EndPoints.createHrAccess)
        .body(body)
        .factory((json) => json['message'] as String? ?? json['result']?['message'] as String? ?? '')
        .execute();
  }
}
