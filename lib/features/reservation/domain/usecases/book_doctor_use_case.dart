import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/reservation/data/models/request/post_reservation_param.dart';
import 'package:bond/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookDoctorUseCase {
  final ReservationRepository repository;

  BookDoctorUseCase(this.repository);

  Future<Either<Failure, Map<String, dynamic>>> call({
    required ReservationParams res,
  }) async {
    return await repository.reservation(res: res);
  }
}
