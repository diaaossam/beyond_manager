import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/sick_leave/data/repositories/sick_leave_repo_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/helper/async_handler.dart';

part 'feedback_state.dart';

@injectable
class FeedbackCubit extends Cubit<BaseState<Map<String, dynamic>>>
    with AsyncHandler<Map<String, dynamic>> {
  final SickLeaveRepositoryImpl sickLeaveRepositoryImpl;

  FeedbackCubit(this.sickLeaveRepositoryImpl) : super(BaseState());

  Future<void> updateAttachment({
    required int sickLeaveId,
    File? file,
    int? attachmentId,
  }) async {
    await handleAsync(
      call: () => sickLeaveRepositoryImpl.updateSickLeave(
        sickLeaveId: sickLeaveId,
        file: file,
        attachmentId: attachmentId,
      ),
      onSuccess: (data) => data,
      identifier: 'update_attachment',
    );
  }

  Future<void> downloadReportAndOpen({
    required String url,
    required String name,
    required bool isPdf,
  }) async {
    await handleAsync(
      call: () async {
        // TODO: Implement actual download logic in repository
        // For now, return success with path
        return Right({'path': url, 'success': true});
      },
      onSuccess: (data) => data,
      identifier: 'open_report',
    );
  }
}
