import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'addation_deletion_state.dart';

class AddationDeletionCubit extends Cubit<AddationDeletionState> {
  AddationDeletionCubit() : super(AddationDeletionInitial());
}
