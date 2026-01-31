import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/async_handler.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/reservation/data/models/request/post_reservation_param.dart';
import 'package:bond/features/reservation/data/repositories/reservation_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookingCubit extends Cubit<BaseState<Unit>> with AsyncHandler<Unit> {
  final ReservationRepositoryImpl reservationRepositoryImpl;

  BookingCubit(this.reservationRepositoryImpl) : super(BaseState.initial());

  Future<void> bookDoctor({required ReservationParams params}) async {
    await handleAsync(
      call: () => reservationRepositoryImpl.reservation(res: params),
      onSuccess: (data) => data,
      identifier: 'book_doctor',
    );
  }
}
