import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/other_line/data/models/other_line_params.dart';
import 'package:bond/features/other_line/data/repositories/other_line_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/bloc/helper/async_handler.dart';
import 'insurance_data.dart';

@injectable
class InsuranceCubit extends Cubit<BaseState<InsuranceData>>
    with AsyncHandler<InsuranceData> {
  final OtherLineRepositoryImpl otherLineRepositoryImpl;

  InsuranceCubit(this.otherLineRepositoryImpl)
      : super(BaseState(data: InsuranceData()));

  List<File> get listFiles => state.data?.files ?? [];

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    if (result != null) {
      final currentFiles = List<File>.from(listFiles);
      if (currentFiles.isEmpty) {
        currentFiles.addAll(
          result.paths.map((path) => File(path!)).toList(),
        );
      } else {
        for (var element in result.paths) {
          File file = File(element!);
          if (!currentFiles.contains(file)) {
            currentFiles.add(file);
          }
        }
      }
      emit(
        state.copyWith(
          data: state.data?.copyWith(files: currentFiles),
        ),
      );
    }
  }

  void removeFileFromList({required File file}) {
    final currentFiles = List<File>.from(listFiles);
    currentFiles.removeWhere((element) => element.path == file.path);
    emit(
      state.copyWith(
        data: state.data?.copyWith(files: currentFiles),
      ),
    );
  }

  Future<void> openExcel({
    required String url,
    required String fileName,
  }) async {
    emit(
      state.copyWith(
        status: BaseStatus.loading,
        identifier: 'openExcel',
      ),
    );
    try {
      Directory? appDocumentsDir;
      if (Platform.isAndroid) {
        appDocumentsDir = await getExternalStorageDirectory();
      } else {
        appDocumentsDir = await getApplicationDocumentsDirectory();
      }
      Dio dio = Dio();

      String path = "${appDocumentsDir!.path}/file$fileName.xlsx";
      await dio.download(url, path);
      emit(
        state.copyWith(
          status: BaseStatus.success,
          identifier: 'openExcel',
          data: state.data?.copyWith(excelPath: path),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BaseStatus.failure,
          identifier: 'openExcel',
          error: e,
        ),
      );
    }
  }

  Future<void> uploadInsurance({
    required String username,
    required String note,
    required String type,
  }) async {
    await handleAsync(
      identifier: 'uploadInsurance',
      call: () => otherLineRepositoryImpl.createOtherLine(
        params: OtherLineParams(
          name: username,
          insuranceType: type,
          note: note,
        ),
        files: listFiles,
      ),
      onSuccess: (data) => state.data ?? InsuranceData(),
    );
  }
}
