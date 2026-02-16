import 'dart:io';

import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:bond/features/other_line/data/models/recommended_main_model.dart';
import 'package:bond/features/other_line/data/models/template_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/enum/recommendation_status.dart';
import '../models/crm_lead_response.dart';
import '../models/other_line_params.dart';
import '../models/recommended_model.dart';

abstract class OtherLineRemoteDataSource {
  Future<String> createOtherLine({
    required OtherLineParams params,
    required List<File> files,
  });

  Future<List<TemplateModel>> getOtherLineTemplates();

  Future<RecommendedModel> getTopRecommended();

  Future<RecommendedMainModel> getAllRecommended({
    required MatchLevelEnum matchLevelEnum,
  });

  Future<CrmLeadResponse> createCrmLead({required num recommendationId});
}

@Injectable(as: OtherLineRemoteDataSource)
class OtherLineRemoteDataSourceImpl implements OtherLineRemoteDataSource {
  final DioConsumer dioConsumer;

  OtherLineRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<String> createOtherLine({
    required OtherLineParams params,
    required List<File> files,
  }) async {
    final formData = FormData();
    for (var file in files) {
      formData.files.add(
        MapEntry('attachment', await MultipartFile.fromFile(file.path)),
      );
    }

    formData.fields.addAll([
      MapEntry('namee', params.name),
      MapEntry('insurance_type', params.insuranceType),
      MapEntry('note', params.note),
    ]);

    return await dioConsumer
        .post(EndPoints.createOtherLine)
        .body(formData)
        .factory((json) => '')
        .execute();
  }

  @override
  Future<List<TemplateModel>> getOtherLineTemplates() async {
    return await dioConsumer.get(EndPoints.getOtherLine).factory((json) {
      return TemplateModel.fromJsonList(json);
    }).execute();
  }

  @override
  Future<RecommendedModel> getTopRecommended() async {
    return await dioConsumer
        .get(EndPoints.getTopRecommend)
        .factory(
          (json) => RecommendedModel.fromJson(json['result']['recommendation']),
        )
        .execute();
  }

  @override
  Future<RecommendedMainModel> getAllRecommended({
    required MatchLevelEnum matchLevelEnum,
  }) async {
    String  matchLevel = "";

      switch (matchLevelEnum) {
        case MatchLevelEnum.all:
          matchLevel = "";
          break;
        case MatchLevelEnum.high:
          matchLevel = "high";
          break;
        case MatchLevelEnum.medium:
          matchLevel = "medium";
          break;
        case MatchLevelEnum.low:
          matchLevel = "low";
          break;
      }

    return await dioConsumer
        .get(EndPoints.getAllRecommend)
        .params({"match_level":matchLevel})
        .factory((json) {
          return RecommendedMainModel.fromJson(json['result']);
        })
        .execute();
  }

  @override
  Future<CrmLeadResponse> createCrmLead({required num recommendationId}) async {
    return await dioConsumer
        .post(EndPoints.createCrmLeam)
        .params({"recommendation_id": recommendationId})
        .factory((json) => CrmLeadResponse.fromJson(json['result']))
        .execute();
  }
}
