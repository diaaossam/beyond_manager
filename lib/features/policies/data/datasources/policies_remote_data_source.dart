import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/global_models/generic_model.dart';
import '../models/request/reimbursement_filter_model.dart';
import '../models/response/active_list_model.dart';
import '../models/response/main_policy_model.dart';
import '../models/response/policy_access_model.dart';
import '../models/response/policy_details.dart';
import '../models/request/get_active_list_params.dart';
import '../models/response/policy_payment.dart';
import '../models/response/reimbursement_model.dart';
import '../models/response/utilization_model.dart';

abstract class PoliciesRemoteDataSource {
  Future<List<MainPolicyModel>> getCompanyPolicies({
    required int page,
    required String state,
  });

  Future<ActiveListModel> getActivePolicy({
    required ActiveListParams activeListParams,
  });

  Future<UtilizationModel> getUtilization({
    required ActiveListParams getActiveListParams,
  });

  Future<MainPolicyPayment> getPolicyPayment({
    required ActiveListParams getActiveListParams,
  });

  Future<PolicyDetails> getPolicyDetails({required num policyId});

  Future<PolicyAccessModel> getPolicyAccess({required int policyId});

  Future<List<GenericModel>> getReimursementStatus();

  Future<ReimbursementResponseModel> getReimursement({
    required ReimbursementFilterModel params,
  });
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
  Future<ActiveListModel> getActivePolicy({
    required ActiveListParams activeListParams,
  }) async {
    return await dioConsumer
        .get(EndPoints.activePolicy)
        .params(activeListParams.toJson())
        .factory((json) => ActiveListModel.fromJson(json))
        .execute();
  }

  @override
  Future<UtilizationModel> getUtilization({
    required ActiveListParams getActiveListParams,
  }) async {
    return await dioConsumer
        .get(EndPoints.utilitzationPolicy)
        .params(getActiveListParams.toJson())
        .factory((json) => UtilizationModel.fromJson(json))
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

  @override
  Future<List<GenericModel>> getReimursementStatus() async {
    return await dioConsumer
        .get(EndPoints.reimbursemtStatus)
        .factory(GenericModel.fromJsonList)
        .execute();
  }

  @override
  Future<ReimbursementResponseModel> getReimursement({
    required ReimbursementFilterModel params,
  }) async {
    return await dioConsumer
        .get(EndPoints.policyAccess)
        .params(params.toQueryParams())
        .factory((json) => ReimbursementResponseModel.fromJson(json))
        .execute();
  }
}
