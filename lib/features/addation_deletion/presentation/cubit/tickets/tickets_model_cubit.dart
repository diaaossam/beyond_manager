import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/helper/async_handler.dart';
import '../../../data/models/request/ticket_params.dart';
import '../../../data/models/response/addition_deletion_ticket.dart';
import '../../../data/repositories/addation_deletion_repository.dart';

@Injectable()
class TicketsAdditionCubit extends Cubit<BaseState<AdditionDeletionTicket>>
    with AsyncHandler<AdditionDeletionTicket> {
  TicketsAdditionCubit(this.deletionRepository) : super(BaseState());

  final AddationDeletionRepository deletionRepository;

  void fetchTicketList({required TicketParams ticketParams}) {}
}
