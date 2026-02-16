import 'dart:io';

import 'package:bond/core/services/api/api_handler_mixin.dart';
import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/other_line/data/datasources/other_line_remote_data_source.dart';
import 'package:bond/features/other_line/data/models/template_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/enum/recommendation_status.dart';
import '../models/crm_lead_response.dart';
import '../models/other_line_params.dart';
import '../models/recommended_main_model.dart';
import '../models/recommended_model.dart';

@LazySingleton()
class OtherLineRepositoryImpl with ApiHandlerMixin {
  final OtherLineRemoteDataSource otherLineRemoteDataSource;

  OtherLineRepositoryImpl({required this.otherLineRemoteDataSource});

  Future<Either<Failure, String>> createOtherLine({
    required OtherLineParams params,
    required List<File> files,
  }) async {
    final response = await handleApi(
      () => otherLineRemoteDataSource.createOtherLine(
        params: params,
        files: files,
      ),
    );
    return response;
  }

  Future<Either<Failure, List<TemplateModel>>> getOtherLineTemplates() async {
    final response = await handleApi(
      () => otherLineRemoteDataSource.getOtherLineTemplates(),
    );
    return response;
  }

  Future<Either<Failure, RecommendedModel>> getTopRecommended() async {
    final response = await handleApi(
      () => otherLineRemoteDataSource.getTopRecommended(),
    );
    return response;
  }

  Future<Either<Failure, RecommendedMainModel>> getAllRecommended({
    required MatchLevelEnum matchLevelEnum,
  }) async {
    final response = await handleApi(
      () => otherLineRemoteDataSource.getAllRecommended(
        matchLevelEnum: matchLevelEnum,
      ),
    );
    return response;
  }

  Future<Either<Failure, CrmLeadResponse>> createCrmLead({
    required num recommendationId,
  }) async {
    final response = await handleApi(
      () => otherLineRemoteDataSource.createCrmLead(
        recommendationId: recommendationId,
      ),
    );
    return response;
  }
}
