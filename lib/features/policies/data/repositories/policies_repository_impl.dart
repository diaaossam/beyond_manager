import 'package:bond/core/services/api/api_handler_mixin.dart';
import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/policies/data/datasources/policies_remote_data_source.dart';
import 'package:bond/features/policies/data/models/response/policy_details.dart';
import 'package:bond/features/policies/data/models/request/get_active_list_params.dart';
import 'package:bond/features/policies/data/models/response/utilization_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/response/active_list_model.dart';
import '../models/response/main_policy_model.dart';
import '../models/response/policy_access_model.dart';
import '../models/response/policy_payment.dart';

@LazySingleton()
class PoliciesRepositoryImpl with ApiHandlerMixin {
  final PoliciesRemoteDataSource policiesRemoteDataSource;

  PoliciesRepositoryImpl({required this.policiesRemoteDataSource});

  Future<Either<Failure, List<MainPolicyModel>>> getCompanyPolicies({
    required int page,
    required String state,
  }) async {
    final response = await handleApi(
      () =>
          policiesRemoteDataSource.getCompanyPolicies(page: page, state: state),
    );
    return response;
  }

  Future<Either<Failure, ActiveListModel>> getActivePolicy({
    required ActiveListParams activeListParams,
  }) async {
    final response = await handleApi(
      () => policiesRemoteDataSource.getActivePolicy(
        activeListParams: activeListParams,
      ),
    );
    return response;
  }

  Future<Either<Failure, UtilizationModel>> getUtilization({
    required ActiveListParams activeListParams,
  }) async {
    final response = await handleApi(
      () => policiesRemoteDataSource.getUtilization(
        getActiveListParams: activeListParams,
      ),
    );
    return response;
  }

  Future<Either<Failure, MainPolicyPayment>> getPolicyPayment({
    required ActiveListParams getActiveListParams,
  }) async {
    final response = await handleApi(
      () => policiesRemoteDataSource.getPolicyPayment(
        getActiveListParams: getActiveListParams,
      ),
    );
    return response;
  }

  Future<Either<Failure, PolicyDetails>> getPolicyDetails({
    required num policyId,
  }) async {
    final response = await handleApi(
      () => policiesRemoteDataSource.getPolicyDetails(policyId: policyId),
    );
    return response;
  }

  Future<Either<Failure, PolicyAccessModel>> getPolicyAccess({
    required int policyId,
  }) async {
    final response = await handleApi(
      () => policiesRemoteDataSource.getPolicyAccess(policyId: policyId),
    );
    return response;
  }
}
