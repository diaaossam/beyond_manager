import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';


abstract class HrAccessRemoteDataSource {}

@LazySingleton(as: HrAccessRemoteDataSource)
class HrAccessRemoteDataSourceImpl implements HrAccessRemoteDataSource {
  final DioConsumer dioConsumer;

  HrAccessRemoteDataSourceImpl({required this.dioConsumer});
}
