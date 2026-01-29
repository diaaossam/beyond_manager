import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/async_handler.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/reservation/data/models/request/post_reservation_param.dart';
import 'package:bond/features/reservation/domain/usecases/book_doctor_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class BookingCubit extends Cubit<BaseState<Map<String, dynamic>>>
    with AsyncHandler<Map<String, dynamic>> {
  final BookDoctorUseCase _bookDoctorUseCase;

  BookingCubit(this._bookDoctorUseCase) : super(BaseState.initial());

  Future<void> bookDoctor({required ReservationParams params}) async {
    await handleAsync(
      call: () => _bookDoctorUseCase(res: params),
      onSuccess: (data) => data,
      identifier: 'book_doctor',
    );
  }
}
