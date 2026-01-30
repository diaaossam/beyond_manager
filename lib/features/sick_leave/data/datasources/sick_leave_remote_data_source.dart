import 'dart:io';

import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/policies/data/models/response/main_policy_model.dart';
import 'package:bond/features/sick_leave/data/models/my_sick_leave.dart';
import 'package:bond/features/sick_leave/data/models/sick_leave_analytics.dart';
import 'package:bond/features/sick_leave/data/models/request/sick_leave_params.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class SickLeaveRemoteDataSource {
  Future<List<MainPolicyModel>> getSickLeaveActiveList({
    required int page,
    required String state,
  });

  Future<String> createNewSickLeave({
    required SickLeaveParams sickLeaveParams,
    required List<File> files,
  });

  Future<List<MySickLeave>> getMySickLeave({
    required int page,
    required String status,
    required int policyId,
  });

  Future<Map<String, dynamic>> updateSickLeave({
    required int sickLeaveId,
    File? file,
    int? attachmentId,
  });

  Future<SickLeaveAnalytics> getSickLeaveAnalytics({required int policyId});
}

@Injectable(as: SickLeaveRemoteDataSource)
class SickLeaveRemoteDataSourceImpl implements SickLeaveRemoteDataSource {
  final DioConsumer dioConsumer;

  SickLeaveRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<MainPolicyModel>> getSickLeaveActiveList({
    required int page,
    required String state,
  }) async {
    return await dioConsumer
        .get(EndPoints.activeSickLeavePolicy)
        .params({
          "page_number": page,
          "page_size": pageSize,
          if (state != "all") "policy_state": state,
        })
        .factory((json) => MainPolicyModel.fromJsonList(json))
        .execute();
  }

  @override
  Future<String> createNewSickLeave({
    required SickLeaveParams sickLeaveParams,
    required List<File> files,
  }) async {
    Map<String, dynamic> map = {};
    map.addAll(sickLeaveParams.toJson());
    map['insurance_id'] = sickLeaveParams.insuredMemberId;

    for (var element in files) {
      map
          .putIfAbsent('attachment', () => [])
          .add(await MultipartFile.fromFile(element.path));
    }
    return await dioConsumer
        .post(EndPoints.createSickLeave)
        .body(FormData.fromMap(map))
        .factory((json) => json['result']['message'])
        .execute();
  }

  @override
  Future<List<MySickLeave>> getMySickLeave({
    required int page,
    required String status,
    required int policyId,
  }) async {
    return await dioConsumer
        .get(EndPoints.getMySickLeave)
        .params({
          "policy_id": policyId,
          "page_number": page,
          "page_size": pageSize,
          "state": status,
        })
        .factory((json) => MySickLeave.fromJsonList(json))
        .execute();
  }

  @override
  Future<Map<String, dynamic>> updateSickLeave({
    required int sickLeaveId,
    File? file,
    int? attachmentId,
  }) async {
    if (file != null) {
      final formData = FormData();
      formData.files.add(
        MapEntry('client_attachments', await MultipartFile.fromFile(file.path)),
      );

      final response = await dioConsumer
          .put(EndPoints.updateMySickLeave)
          .params({"id": sickLeaveId})
          .body(formData)
          .factory((json) => json['added_files'][0] as Map<String, dynamic>)
          .execute();
      return response;
    } else if (attachmentId != null) {
      await dioConsumer
          .put(EndPoints.updateMySickLeave)
          .params({"id": sickLeaveId, "delete_attachments_ids": attachmentId})
          .factory((json) => json)
          .execute();
      return {"message": "Files deleted successfully."};
    }
    throw Exception("Either file or attachmentId must be provided");
  }

  @override
  Future<SickLeaveAnalytics> getSickLeaveAnalytics({
    required int policyId,
  }) async {
    return await dioConsumer
        .get(EndPoints.sickLeaveAnalytics)
        .params({"policy_id": policyId})
        .factory((json) => SickLeaveAnalytics.fromJson(json))
        .execute();
  }
}
