import 'package:injectable/injectable.dart';
import '../../../../core/services/api/api_handler_mixin.dart';
import '../datasources/hr_access_remote_data_source.dart';

@LazySingleton()
class HrAccessRepository with ApiHandlerMixin {
  final HrAccessRemoteDataSource remoteDataSource;

  HrAccessRepository({required this.remoteDataSource});
}
