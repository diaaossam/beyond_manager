import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/async_handler.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/reservation/data/models/response/my_reservation.dart';
import 'package:bond/features/reservation/data/repositories/reservation_repository_impl.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReservationCubit extends Cubit<BaseState<List<MyReservation>>>
    with AsyncHandler<List<MyReservation>> {
  final ReservationRepositoryImpl reservationRepositoryImpl;

  ReservationCubit(this.reservationRepositoryImpl)
      : super(BaseState.initial(data: []));

  Future<void> getMyReservations({required String status}) async {
    await handleAsync(
      call: () => reservationRepositoryImpl.getReservation(status: status),
      onSuccess: (reservations) => reservations,
      identifier: 'get_reservations',
    );
  }
}
