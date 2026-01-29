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

  Future<SickLeaveAnalytics> getSickLeaveAnalytics({
    required int policyId,
  });
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
    final formData = FormData();

    // Add files to form data
    for (var file in files) {
      formData.files.add(
        MapEntry('attachment', await MultipartFile.fromFile(file.path)),
      );
    }

    // Add other parameters
    formData.fields.addAll([
      MapEntry('policy_id', sickLeaveParams.policyId.toString()),
      MapEntry('insurance_id', sickLeaveParams.insuredMemberId.toString()),
      MapEntry('diagnosis', sickLeaveParams.diagnosis ?? ''),
      MapEntry('diagnosis_code', sickLeaveParams.diagnosisCode ?? ''),
      MapEntry('number_of_days', sickLeaveParams.numberOfDays.toString()),
      MapEntry('date_of_injury', sickLeaveParams.dateOfInjury ?? ''),
      MapEntry('return_date', sickLeaveParams.returnDate ?? ''),
      if (sickLeaveParams.other != null)
        MapEntry('other', sickLeaveParams.other!),
    ]);

    final response = await dioConsumer
        .post(EndPoints.createSickLeave)
        .body(formData)
        .factory((json) => json['message'] as String)
        .execute();
    return response;
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
          .params({
            "id": sickLeaveId,
            "delete_attachments_ids": attachmentId,
          })
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
