import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/addation_deletion/data/repositories/addation_deletion_repository.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/helper/async_handler.dart';
import '../../../data/models/response/manual_entry_params.dart';
import 'addation_data.dart';

@injectable
class AddationCubit extends Cubit<BaseState<AddationData>>
    with AsyncHandler<AddationData> {
  final AddationDeletionRepository addationRepository;

  AddationCubit(this.addationRepository) : super(BaseState()) {
    fetchRelationships();
  }

  Future<void> fetchRelationships() async {
    await handleAsync(
      identifier: "relationship",
      call: () => addationRepository.fetchRelations(),
      onSuccess: (data) {
        final currentData = state.data ?? AddationData();
        final updatedData = currentData.copyWith(relationships: data);
        return updatedData;
      },
    );
  }

  Future<void> submitMembers(List<MemberFormData> members) async {
    await handleAsync(
      identifier: "submit_members",
      call: () => addationRepository.submitMembers(members),
      onSuccess: (response) {
        final currentData = state.data ?? AddationData();
        final updatedData = currentData.copyWith(msg: response);
        return updatedData;
      },
    );
  }
}
