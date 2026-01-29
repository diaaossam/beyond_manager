import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/reservation/data/models/request/branches_params.dart';
import 'package:bond/features/reservation/data/models/response/branch_model.dart';
import 'package:bond/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllBranchesUseCase {
  final ReservationRepository repository;

  GetAllBranchesUseCase(this.repository);

  Future<Either<Failure, List<BranchModel>>> call({
    required BranchesParams branches,
  }) async {
    return await repository.getAllBranches(branches: branches);
  }
}
