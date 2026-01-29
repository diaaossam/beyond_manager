import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/reservation/data/models/request/search_doctor_params.dart';
import 'package:bond/features/reservation/data/models/response/doctors_result.dart';
import 'package:bond/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchForDoctorsUseCase {
  final ReservationRepository repository;

  SearchForDoctorsUseCase(this.repository);

  Future<Either<Failure, DoctorsResult>> call({
    required SearchDoctorParams search,
  }) async {
    return await repository.searchForDoctors(search: search);
  }
}
