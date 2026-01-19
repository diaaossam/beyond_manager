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
    required GetActiveListParams getActiveListParams,
  });

  Future<UtilizationPolicyModel> getUtilization({
    required GetActiveListParams getActiveListParams,
  });

  Future<MainPolicyPayment> getPolicyPayment({
    required GetActiveListParams getActiveListParams,
  });

  Future<PolicyDetails> getPolicyDetails({
    required GetActiveListParams getActiveListParams,
  });

  Future<PolicyAccessModel> getPolicyAccess({required int policyId});

  Future<String> getTerms();
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
          if (state != "All") "policy_state": state,
        })
        .factory((json) {
          // json is already the raw response
          if (json is List) {
            return (json as List)
                .map((e) => MainPolicyModel.fromJson(e as Map<String, dynamic>))
                .toList();
          } else {
            // In case it's wrapped in a result key
            final jsonMap = json as Map;
            final list = jsonMap['result'];
            if (list is List) {
              return list
                  .map((e) => MainPolicyModel.fromJson(e as Map<String, dynamic>))
                  .toList();
            }
          }
          return <MainPolicyModel>[];
        })
        .execute();
  }

  @override
  Future<ActiveListPolicyModel> getActivePolicy({
    required GetActiveListParams getActiveListParams,
  }) async {
    return await dioConsumer
        .get(EndPoints.activePolicy)
        .params(getActiveListParams.toJson())
        .factory((json) => ActiveListPolicyModel.fromJson(json))
        .execute();
  }

  @override
  Future<UtilizationPolicyModel> getUtilization({
    required GetActiveListParams getActiveListParams,
  }) async {
    return await dioConsumer
        .get(EndPoints.utilitzationPolicy)
        .params(getActiveListParams.toJson())
        .factory((json) => UtilizationPolicyModel.fromJson(json))
        .execute();
  }

  @override
  Future<MainPolicyPayment> getPolicyPayment({
    required GetActiveListParams getActiveListParams,
  }) async {
    return await dioConsumer
        .get(EndPoints.policyPayment)
        .params(getActiveListParams.toJson())
        .factory((json) => MainPolicyPayment.fromJson(json))
        .execute();
  }

  @override
  Future<PolicyDetails> getPolicyDetails({
    required GetActiveListParams getActiveListParams,
  }) async {
    return await dioConsumer
        .get(EndPoints.policyDetails)
        .params(getActiveListParams.toJson())
        .factory((json) {
          if (json is List && json.isNotEmpty) {
            return PolicyDetails.fromJson(json[0]);
          }
          return PolicyDetails.fromJson(json);
        })
        .execute();
  }

  @override
  Future<PolicyAccessModel> getPolicyAccess({required int policyId}) async {
    return await dioConsumer
        .get(EndPoints.policyAccess)
        .params({"policy_id": policyId})
        .factory((json) {
          if (json is List && json.isNotEmpty) {
            return PolicyAccessModel.fromJson(json[0]);
          }
          return PolicyAccessModel.fromJson(json);
        })
        .execute();
  }

  @override
  Future<String> getTerms() async {
    return await dioConsumer
        .get(EndPoints.terms)
        .factory((json) {
          if (json.containsKey('result') && 
              json['result'] is Map &&
              json['result'].containsKey('conditions')) {
            return json['result']['conditions'] as String;
          }
          return '';
        })
        .execute();
  }
}
