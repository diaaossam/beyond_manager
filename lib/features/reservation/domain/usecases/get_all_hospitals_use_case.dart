import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/reservation/data/models/response/hospitals_model.dart';
import 'package:bond/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllHospitalsUseCase {
  final ReservationRepository repository;

  GetAllHospitalsUseCase(this.repository);

  Future<Either<Failure, List<HospitalsModel>>> call() async {
    return await repository.getAllHospitals();
  }
}
