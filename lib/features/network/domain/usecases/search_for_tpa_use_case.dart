import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/network/data/models/search_params.dart';
import 'package:bond/features/network/domain/repositories/network_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchForTpaUseCase {
  final NetworkRepository repository;

  SearchForTpaUseCase(this.repository);

  Future<Either<Failure, Map<String, dynamic>>> call({
    required SearchParamsModel searchParamsModel,
  }) async {
    return await repository.searchForTpa(
      searchParamsModel: searchParamsModel,
    );
  }
}
