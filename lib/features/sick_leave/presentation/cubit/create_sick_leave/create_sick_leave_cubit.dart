import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/sick_leave/data/models/request/sick_leave_params.dart';
import 'package:bond/features/sick_leave/data/repositories/sick_leave_repo_impl.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/helper/async_handler.dart';

part 'create_sick_leave_state.dart';

@injectable
class CreateSickLeaveCubit extends Cubit<BaseState<List<File>>>
    with AsyncHandler<List<File>> {
  final SickLeaveRepositoryImpl sickLeaveRepositoryImpl;

  CreateSickLeaveCubit(this.sickLeaveRepositoryImpl) : super(BaseState());

  String ? msg;
  Future<void> createNewSickLeave({
    required SickLeaveParams sickLeaveParams,
  }) async {
    await handleAsync(
      call: () => sickLeaveRepositoryImpl.createNewSickLeave(
        sickLeaveParams: sickLeaveParams,
        files: state.data ?? [],
      ),
      onSuccess: (data) => [],
      identifier: 'create_sick_leave',
    );
  }

  void updateFiles({required List<File> files}) {
    emit(BaseState(status: BaseStatus.success, data: files));
  }

  void removeFileFromList({required File file}) {
    state.data?.removeWhere((element) => element.path == file.path);
    emit(BaseState(status: BaseStatus.success, data: state.data));
  }

  void clearFiles() {
    state.data?.clear();
    emit(BaseState(status: BaseStatus.success, data: state.data));
  }
}
