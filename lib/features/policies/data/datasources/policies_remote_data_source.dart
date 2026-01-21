import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:injectable/injectable.dart';

import '../models/active_list_policy_model.dart';
import '../models/main_policy_model.dart';
import '../models/policy_access_model.dart';
import '../models/policy_details.dart';
import '../models/policy_payment.dart';
import '../models/utilization_policy_model.dart';
import '../models/get_active_list_params.dart';

abstract class PoliciesRemoteDataSource {
  Future<List<MainPolicyModel>> getCompanyPolicies({
    required int page,
    required String state,
  });

  Future<ActiveListPolicyModel> getActivePolicy({
    required ActiveListParams getActiveListParams,
  });

  Future<UtilizationPolicyModel> getUtilization({
    required ActiveListParams getActiveListParams,
  });

  Future<MainPolicyPayment> getPolicyPayment({
    required ActiveListParams getActiveListParams,
  });

  Future<PolicyDetails> getPolicyDetails({required num policyId});

  Future<PolicyAccessModel> getPolicyAccess({required int policyId});
}

@Injectable(as: PoliciesRemoteDataSource)
class PoliciesRemoteDataSourceImpl implements PoliciesRemoteDataSource {
  final DioConsumer dioConsumer;

  PoliciesRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<MainPolicyModel>> getCompanyPolicies({
    required int page,
    required String state,
  }) async {
    return await dioConsumer
        .get(EndPoints.companyPolicies)
        .params({
          "page_number": page,
          "page_size": pageSize,
          if (state != "all") "policy_state": state,
        })
        .factory((json) => MainPolicyModel.fromJsonList(json))
        .execute();
  }

  @override
  Future<ActiveListPolicyModel> getActivePolicy({
    required ActiveListParams getActiveListParams,
  }) async {
    return await dioConsumer
        .get(EndPoints.activePolicy)
        .params(getActiveListParams.toJson())
        .factory((json) => ActiveListPolicyModel.fromJson(json))
        .execute();
  }

  @override
  Future<UtilizationPolicyModel> getUtilization({
    required ActiveListParams getActiveListParams,
  }) async {
    return await dioConsumer
        .get(EndPoints.utilitzationPolicy)
        .params(getActiveListParams.toJson())
        .factory((json) => UtilizationPolicyModel.fromJson(json))
        .execute();
  }

  @override
  Future<MainPolicyPayment> getPolicyPayment({
    required ActiveListParams getActiveListParams,
  }) async {
    return await dioConsumer
        .get(EndPoints.policyPayment)
        .params(getActiveListParams.toJson())
        .factory((json) => MainPolicyPayment.fromJson(json))
        .execute();
  }

  @override
  Future<PolicyDetails> getPolicyDetails({required num policyId}) async {
    return await dioConsumer
        .get(EndPoints.policyDetails)
        .params({"policy_id": policyId})
        .factory((json) => PolicyDetails.fromJson(json['result'][0]))
        .execute();
  }

  @override
  Future<PolicyAccessModel> getPolicyAccess({required int policyId}) async {
    return await dioConsumer
        .get(EndPoints.policyAccess)
        .params({"policy_id": policyId})
        .factory((json) => PolicyAccessModel.fromJson(json['result'][0]))
        .execute();
  }
}
