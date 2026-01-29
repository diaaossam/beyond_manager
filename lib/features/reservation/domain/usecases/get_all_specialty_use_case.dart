import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/reservation/data/models/request/speciality_params.dart';
import 'package:bond/features/reservation/data/models/response/speciality_model.dart';
import 'package:bond/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllSpecialityUseCase {
  final ReservationRepository repository;

  GetAllSpecialityUseCase(this.repository);

  Future<Either<Failure, List<SpecialityModel>>> call({
    required SpecialityParams params,
  }) async {
    return await repository.getSpecialities(params: params);
  }
}
