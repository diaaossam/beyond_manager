import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/network/data/models/tpa_model.dart';
import 'package:bond/features/network/domain/repositories/network_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllTpaUseCase {
  final NetworkRepository repository;

  GetAllTpaUseCase(this.repository);

  Future<Either<Failure, List<TpaModel>>> call() async {
    return await repository.getAllTpa();
  }
}
