import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/global_models/generic_model.dart';
import '../../../../core/utils/api_config.dart';
import '../models/request/reimbursement_filter_model.dart';
import '../models/request/utilization_notification_params.dart';
import '../models/request/utilization_notification_values.dart';
import '../models/response/active_list_model.dart';
import '../models/response/deep_study_model.dart';
import '../models/response/main_policy_model.dart';
import '../models/response/notification_value_model.dart';
import '../models/response/policy_access_model.dart';
import '../models/response/policy_details.dart';
import '../models/request/get_active_list_params.dart';
import '../models/response/policy_payment.dart';
import '../models/response/reimbursement_model.dart';
import '../models/response/utilization_model.dart';
import '../models/response/utilization_notification_item_model.dart';

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

  Future<ReimbursementResponseModel> getReimursement({
    required ReimbursementFilterModel params,
  });

  Future<String> setUtilizationNotification({
    required UtilizationNotificationValues utilizationNotificationValues,
  });

  Future<UtilizationNotificationModel> getUtilizationNotifications({
    required UtilizationNotificationParams params,
  });

  Future<String> sendDeepDive({required num policyId, required String message});

  Future<List<DeepStudyModel>> getDeepStudy();

  Future<NotificationValueModel> getNotificationValues({required num policyId});
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
        .get(EndPoints.reimbursemt)
        .params(params.toQueryParams())
        .factory((json) async {
          if (params.pageKey == 1) {
            final status = await getReimursementStatus();
            final data = (ReimbursementResponseModel.fromJson(
              json,
            )).copyWith(status: status);
            return data;
          } else {
            return ReimbursementResponseModel.fromJson(json);
          }
        })
        .execute();
  }

  @override
  Future<String> setUtilizationNotification({
    required UtilizationNotificationValues utilizationNotificationValues,
  }) async {
    return await dioConsumer
        .post(EndPoints.setNotificationUtilization)
        .params(utilizationNotificationValues.toJson())
        .factory((json) async {
          return json['result']['message'];
        })
        .execute();
  }

  @override
  Future<UtilizationNotificationModel> getUtilizationNotifications({
    required UtilizationNotificationParams params,
  }) async {
    return await dioConsumer
        .get(EndPoints.getUtilizationNotifications)
        .params(params.toJson())
        .factory(UtilizationNotificationModel.fromJson)
        .execute();
  }

  @override
  Future<String> sendDeepDive({
    required num policyId,
    required String message,
  }) async {
    return await dioConsumer
        .post(EndPoints.sendDeepDive)
        .params({
          "policy_id": policyId,
          "hr_email": UserDataService().getUserData()?.email,
          "message": message,
        })
        .factory((json) async {
          return json['result']['message'];
        })
        .execute();
  }

  @override
  Future<List<DeepStudyModel>> getDeepStudy() async {
    return await dioConsumer
        .get(EndPoints.getDeepDive)
        .params({"client_id": ApiConfig.userId})
        .factory(DeepStudyModel.fromJsonList)
        .execute();
  }

  @override
  Future<NotificationValueModel> getNotificationValues({
    required num policyId,
  }) async {
    return await dioConsumer
        .get(EndPoints.getNotificationValue)
        .params({"policy_id": policyId})
        .factory((json) => NotificationValueModel.fromJson(json['result']))
        .execute();
  }
}
