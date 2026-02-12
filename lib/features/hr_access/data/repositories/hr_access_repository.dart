import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/api/api_handler_mixin.dart';
import '../../../../core/services/network/error/failures.dart';
import '../datasources/hr_access_remote_data_source.dart';
import '../models/response/manager_form_data.dart';
import '../models/response/manager_list_item.dart';
import '../models/response/policy_access_item.dart';

@LazySingleton()
class HrAccessRepository with ApiHandlerMixin {
  final HrAccessRemoteDataSource remoteDataSource;

  HrAccessRepository({required this.remoteDataSource});

  Future<Either<Failure, String>> submitManagers(
    List<ManagerFormData> managers,
  ) async {
    return handleApi(
      () async => await remoteDataSource.createHrAccess(managers),
    );
  }

  Future<Either<Failure, List<ManagerListItem>>> getManagers() async {
    return handleApi(() async => await remoteDataSource.getManagers());
  }

  Future<Either<Failure, String>> updateManager({
    required num managerId,
    required String name,
    required bool reimbursement,
    required List<PolicyAccessItem> policies,
  }) async {
    return handleApi(
      () async => await remoteDataSource.updateManager(
        managerId: managerId,
        name: name,
        reimbursement: reimbursement,
        policies: policies,
      ),
    );
  }
}
