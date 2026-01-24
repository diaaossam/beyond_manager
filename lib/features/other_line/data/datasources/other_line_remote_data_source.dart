import 'dart:io';

import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:bond/features/other_line/data/models/template_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../models/other_line_params.dart';

abstract class OtherLineRemoteDataSource {
  Future<String> createOtherLine({
    required OtherLineParams params,
    required List<File> files,
  });

  Future<List<TemplateModel>> getOtherLineTemplates();
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

    // Add files to form data
    for (var file in files) {
      formData.files.add(
        MapEntry('attachment', await MultipartFile.fromFile(file.path)),
      );
    }

    // Add other parameters
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
}
