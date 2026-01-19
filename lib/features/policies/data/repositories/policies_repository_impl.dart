import 'package:bond/core/services/api/api_handler_mixin.dart';
import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/policies/data/datasources/policies_remote_data_source.dart';
import 'package:bond/features/policies/data/models/active_list_policy_model.dart';
import 'package:bond/features/policies/data/models/main_policy_model.dart';
import 'package:bond/features/policies/data/models/policy_access_model.dart';
import 'package:bond/features/policies/data/models/policy_details.dart';
import 'package:bond/features/policies/data/models/policy_payment.dart';
import 'package:bond/features/policies/data/models/utilization_policy_model.dart';
import 'package:bond/features/policies/data/models/get_active_list_params.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class PoliciesRepositoryImpl with ApiHandlerMixin {
  final PoliciesRemoteDataSource policiesRemoteDataSource;

  PoliciesRepositoryImpl({required this.policiesRemoteDataSource});

  Future<Either<Failure, List<MainPolicyModel>>> getCompanyPolicies({
    required int page,
    required String state,
  }) async {
    final response = await handleApi(
      () => policiesRemoteDataSource.getCompanyPolicies(
        page: page,
        state: state,
      ),
    );
    return response;
  }

  Future<Either<Failure, ActiveListPolicyModel>> getActivePolicy({
    required GetActiveListParams getActiveListParams,
  }) async {
    final response = await handleApi(
      () => policiesRemoteDataSource.getActivePolicy(
        getActiveListParams: getActiveListParams,
      ),
    );
    return response;
  }

  Future<Either<Failure, UtilizationPolicyModel>> getUtilization({
    required GetActiveListParams getActiveListParams,
  }) async {
    final response = await handleApi(
      () => policiesRemoteDataSource.getUtilization(
        getActiveListParams: getActiveListParams,
      ),
    );
    return response;
  }

  Future<Either<Failure, MainPolicyPayment>> getPolicyPayment({
    required GetActiveListParams getActiveListParams,
  }) async {
    final response = await handleApi(
      () => policiesRemoteDataSource.getPolicyPayment(
        getActiveListParams: getActiveListParams,
      ),
    );
    return response;
  }

  Future<Either<Failure, PolicyDetails>> getPolicyDetails({
    required GetActiveListParams getActiveListParams,
  }) async {
    final response = await handleApi(
      () => policiesRemoteDataSource.getPolicyDetails(
        getActiveListParams: getActiveListParams,
      ),
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

  Future<Either<Failure, String>> getTerms() async {
    final response = await handleApi(
      () => policiesRemoteDataSource.getTerms(),
    );
    return response;
  }
}
