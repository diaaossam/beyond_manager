import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../models/app_settings.dart';

abstract class SettingsRemoteDataSource {
  Future<AppSettings> getAppSettings();

  Future<String> getTerms();
}

@Injectable(as: SettingsRemoteDataSource)
class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final DioConsumer dioConsumer;

  SettingsRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<AppSettings> getAppSettings() async {
    final response = await dioConsumer
        .get(EndPoints.getSettings)
        .factory((json) => AppSettings.fromJson(json['data']))
        .execute();
    return response;
  }

  @override
  Future<String> getTerms() async {
    final response = await dioConsumer
        .get(EndPoints.terms)
        .factory((json) => json['data']['conditions'] as String)
        .execute();
    return response;
  }
}
