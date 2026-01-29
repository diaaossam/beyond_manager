import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/reservation/data/models/request/timeslot_params.dart';
import 'package:bond/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTimeSlotUseCase {
  final ReservationRepository repository;

  GetTimeSlotUseCase(this.repository);

  Future<Either<Failure, Map<String, dynamic>>> call({
    required DoctorBookingParams params,
  }) async {
    return await repository.getTimeSlot(params: params);
  }
}
