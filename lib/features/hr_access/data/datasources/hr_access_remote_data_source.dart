import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../models/response/manager_form_data.dart';
import '../models/response/manager_list_item.dart';
import '../models/response/policy_access_item.dart';

abstract class HrAccessRemoteDataSource {
  Future<String> createHrAccess(List<ManagerFormData> managers);

  Future<List<ManagerListItem>> getManagers();

  Future<String> updateManager({
    required num managerId,
    required String name,
    required bool reimbursement,
    required List<PolicyAccessItem> policies,
  });
}

@LazySingleton(as: HrAccessRemoteDataSource)
class HrAccessRemoteDataSourceImpl implements HrAccessRemoteDataSource {
  final DioConsumer dioConsumer;

  HrAccessRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<String> createHrAccess(List<ManagerFormData> managers) async {
    final body = {'managers': managers.map((m) => m.toJson()).toList()};
    return await dioConsumer
        .post(EndPoints.createHrAccess)
        .body(body)
        .factory(
          (json) =>
              json['message'] as String? ??
              json['result']?['message'] as String? ??
              '',
        )
        .execute();
  }

  @override
  Future<List<ManagerListItem>> getManagers() async {
    return await dioConsumer
        .get(EndPoints.getManagers)
        .factory((json) => ManagerListItem.fromJsonList(json))
        .execute();
  }

  @override
  Future<String> updateManager({
    required num managerId,
    required String name,
    required bool reimbursement,
    required List<PolicyAccessItem> policies,
  }) async {
    final body = {
      'manager_id': managerId,
      'name': name,
      'reimbursement': reimbursement,
      'policies': policies.map((p) => p.toJson()).toList(),
    };
    return await dioConsumer
        .put(EndPoints.updateManager, data: body)
        .factory(
          (json) =>
              json['message'] as String? ??
              json['result']?['message'] as String? ??
              '',
        )
        .execute();
  }
}
