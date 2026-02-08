import 'package:bond/features/addation_deletion/data/models/response/relationship_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../../../policies/data/models/request/get_active_list_params.dart';
import '../models/request/policies_branches_params.dart';
import '../models/request/policies_data_params.dart';
import '../models/response/branch_response.dart';
import '../models/response/deletion_response_model.dart';
import '../models/response/manual_entry_params.dart';
import '../models/response/policies_data_addation.dart';

abstract class HrAccessRemoteDataSource {}

@LazySingleton(as: HrAccessRemoteDataSource)
class HrAccessRemoteDataSourceImpl implements HrAccessRemoteDataSource {
  final DioConsumer dioConsumer;

  HrAccessRemoteDataSourceImpl({required this.dioConsumer});
}
