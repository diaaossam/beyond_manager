import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/async_handler.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/reservation/data/models/response/my_reservation.dart';
import 'package:bond/features/reservation/domain/usecases/get_my_reservation_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReservationCubit extends Cubit<BaseState<List<MyReservation>>>
    with AsyncHandler<List<MyReservation>> {
  final GetMyReservationUseCase _getMyReservationUseCase;

  ReservationCubit(this._getMyReservationUseCase) : super(BaseState.initial());

  List<MyReservation> myReservations = [];

  Future<void> getMyReservations({required String status}) async {
    await handleAsync(
      call: () => _getMyReservationUseCase(status: status),
      onSuccess: (data) {
        myReservations = data;
        return data;
      },
      identifier: 'get_reservations',
    );
  }
}
