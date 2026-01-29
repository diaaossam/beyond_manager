import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/sick_leave/data/models/request/sick_leave_params.dart';
import 'package:bond/features/sick_leave/data/repositories/sick_leave_repo_impl.dart';
import 'package:injectable/injectable.dart';

part 'create_sick_leave_state.dart';

@injectable
class CreateSickLeaveCubit extends Cubit<BaseState<String>>
    with AsyncHandler<String> {
  final SickLeaveRepositoryImpl sickLeaveRepositoryImpl;

  CreateSickLeaveCubit(this.sickLeaveRepositoryImpl) : super(BaseState());

  List<File> listFiles = [];

  Future<void> createNewSickLeave({
    required SickLeaveParams sickLeaveParams,
  }) async {
    await handleAsync(
      call: () => sickLeaveRepositoryImpl.createNewSickLeave(
        sickLeaveParams: sickLeaveParams,
        files: listFiles,
      ),
      onSuccess: (data) {
        listFiles.clear();
        return data;
      },
      identifier: 'create_sick_leave',
    );
  }

  void updateFiles({required List<File> files}) {
    listFiles = files;
    emit(state.copyWith());
  }

  void removeFileFromList({required File file}) {
    listFiles.removeWhere((element) => element.path == file.path);
    emit(state.copyWith());
  }

  void clearFiles() {
    listFiles.clear();
    emit(state.copyWith());
  }
}
