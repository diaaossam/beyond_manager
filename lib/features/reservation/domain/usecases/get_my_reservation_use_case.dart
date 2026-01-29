import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/reservation/data/models/response/my_reservation.dart';
import 'package:bond/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMyReservationUseCase {
  final ReservationRepository repository;

  GetMyReservationUseCase(this.repository);

  Future<Either<Failure, List<MyReservation>>> call({
    required String status,
  }) async {
    return await repository.getReservation(status: status);
  }
}
