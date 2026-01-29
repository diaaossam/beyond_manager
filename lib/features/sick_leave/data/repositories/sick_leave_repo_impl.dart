import 'dart:io';

import 'package:bond/core/services/api/api_handler_mixin.dart';
import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/policies/data/models/response/main_policy_model.dart';
import 'package:bond/features/sick_leave/data/datasources/sick_leave_remote_data_source.dart';
import 'package:bond/features/sick_leave/data/models/my_sick_leave.dart';
import 'package:bond/features/sick_leave/data/models/request/sick_leave_params.dart';
import 'package:bond/features/sick_leave/data/models/sick_leave_analytics.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class SickLeaveRepositoryImpl with ApiHandlerMixin {
  final SickLeaveRemoteDataSource sickLeaveRemoteDataSource;

  SickLeaveRepositoryImpl({required this.sickLeaveRemoteDataSource});

  Future<Either<Failure, List<MainPolicyModel>>> getSickLeaveActiveList({
    required int page,
    required String state,
  }) async {
    final response = await handleApi(
      () => sickLeaveRemoteDataSource.getSickLeaveActiveList(
        page: page,
        state: state,
      ),
    );
    return response;
  }

  Future<Either<Failure, String>> createNewSickLeave({
    required SickLeaveParams sickLeaveParams,
    required List<File> files,
  }) async {
    final response = await handleApi(
      () => sickLeaveRemoteDataSource.createNewSickLeave(
        sickLeaveParams: sickLeaveParams,
        files: files,
      ),
    );
    return response;
  }

  Future<Either<Failure, List<MySickLeave>>> getMySickLeave({
    required int page,
    required String status,
    required int policyId,
  }) async {
    final response = await handleApi(
      () => sickLeaveRemoteDataSource.getMySickLeave(
        page: page,
        status: status,
        policyId: policyId,
      ),
    );
    return response;
  }

  Future<Either<Failure, Map<String, dynamic>>> updateSickLeave({
    required int sickLeaveId,
    File? file,
    int? attachmentId,
  }) async {
    final response = await handleApi(
      () => sickLeaveRemoteDataSource.updateSickLeave(
        sickLeaveId: sickLeaveId,
        file: file,
        attachmentId: attachmentId,
      ),
    );
    return response;
  }

  Future<Either<Failure, SickLeaveAnalytics>> getSickLeaveAnalytics({
    required int policyId,
  }) async {
    final response = await handleApi(
      () => sickLeaveRemoteDataSource.getSickLeaveAnalytics(policyId: policyId),
    );
    return response;
  }
}
