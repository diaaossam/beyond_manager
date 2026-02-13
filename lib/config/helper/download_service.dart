import 'dart:io';
import 'package:bond/features/policies/data/models/response/active_list_model.dart';
import 'package:bond/features/policies/data/models/response/reimbursement_model.dart';
import 'package:dio/dio.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

/// Result class for file operations
class FileOperationResult {
  final bool success;
  final String message;
  final String? filePath;

  FileOperationResult({
    required this.success,
    required this.message,
    this.filePath,
  });

  factory FileOperationResult.success(String filePath) {
    return FileOperationResult(
      success: true,
      message: 'Operation completed successfully',
      filePath: filePath,
    );
  }

  factory FileOperationResult.failure(String message) {
    return FileOperationResult(success: false, message: message);
  }
}

class DownloadServiceHelper {
  Future<String> _getSaveDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// Save bytes to file and return the file path
  Future<String> _saveFile(List<int> bytes, String fileName) async {
    final path = await _getSaveDirectory();
    final filePath = '$path/$fileName';
    final file = File(filePath);
    await file.writeAsBytes(bytes, flush: true);
    return filePath;
  }

  /// Open file using the system default app
  Future<void> _openFile(String filePath) async {
    try {
      final result = await OpenFile.open(filePath);
      if (result.type != ResultType.done) {
        // If can't open, try sharing instead
        await _shareFile(filePath);
      }
    } catch (e) {
      // Fallback to sharing if opening fails
      await _shareFile(filePath);
    }
  }

  /// Share file using system share dialog
  Future<void> _shareFile(String filePath) async {
    try {
      await Share.shareXFiles([XFile(filePath)], subject: 'Excel File');
    } catch (e) {
      print('Error sharing file: $e');
    }
  }

  /// Create Active List Excel file
  Future<FileOperationResult> createActiveListExcel({
    required List<Result> bigRecord,
    required bool isMedical,
    required bool isBusinessLife,
  }) async {
    if (bigRecord.isEmpty) {
      return FileOperationResult.failure('No data to export');
    }

    try {
      final Workbook workbook = Workbook();
      final Worksheet sheet = workbook.worksheets[0];

      if (isBusinessLife) {
        _setupBusinessLifeHeaders(sheet);
        _populateBusinessLifeData(sheet, bigRecord);
      } else if (isMedical) {
        _setupMedicalHeaders(sheet);
        _populateMedicalData(sheet, bigRecord);
      } else {
        _setupUtiHeaders(sheet);
        _populateUtiData(sheet, bigRecord);
      }

      final List<int> bytes = workbook.saveAsStream();
      workbook.dispose();

      final filePath = await _saveFile(bytes, 'ActiveList.xlsx');
      await _openFile(filePath);

      return FileOperationResult.success(filePath);
    } catch (e) {
      return FileOperationResult.failure('Error creating Excel: $e');
    }
  }

  void _setupBusinessLifeHeaders(Worksheet sheet) {
    final headers = [
      'Name',
      'StaffID',
      'Branch',
      'Plan',
      'StartDate',
      'End Date',
      'BankAccount',
      'Member Status',
      'deletionDate',
      'beyondDeletionDate',
      'Reactivation Date',
    ];
    for (int i = 0; i < headers.length; i++) {
      sheet.getRangeByIndex(1, i + 1).setText(headers[i]);
    }
  }

  void _populateBusinessLifeData(Worksheet sheet, List<Result> data) {
    int rowIndex = 2;
    for (final record in data) {
      if (record.memberStatus != "Deleted" &&
          record.memberStatus != "Under Deletion") {
        sheet.getRangeByIndex(rowIndex, 1).setText(record.member);
        sheet.getRangeByIndex(rowIndex, 2).setText(record.staff);
        sheet.getRangeByIndex(rowIndex, 3).setText(record.branch);
        sheet.getRangeByIndex(rowIndex, 4).setText(record.plan);
        sheet.getRangeByIndex(rowIndex, 5).setText(record.startDate);
        sheet.getRangeByIndex(rowIndex, 6).setText(record.endDate);
        sheet.getRangeByIndex(rowIndex, 7).setText(record.bankAccount);
        sheet.getRangeByIndex(rowIndex, 8).setText(record.memberStatus ?? '');
        sheet.getRangeByIndex(rowIndex, 9).setText(record.deletionDate);
        sheet.getRangeByIndex(rowIndex, 10).setText(record.beyondDeletionDate);
        sheet.getRangeByIndex(rowIndex, 11).setText(record.reactivationDate);
        rowIndex++;
      }
    }
  }

  void _setupMedicalHeaders(Worksheet sheet) {
    final headers = [
      'Name',
      'InsuranceID',
      'Branch',
      'BankAccount',
      'category',
      'beyondDeletionDate',
      'Member Status',
      'deletionDate',
      'NameOnInsuranceCard',
      'Plan',
      'PrincipalInsuranceID',
      'StartDate',
      'End Date',
      'Relation',
      'StaffID',
      'Reactivation Date',
    ];
    for (int i = 0; i < headers.length; i++) {
      sheet.getRangeByIndex(1, i + 1).setText(headers[i]);
    }
  }

  void _populateMedicalData(Worksheet sheet, List<Result> data) {
    for (int i = 0; i < data.length; i++) {
      final record = data[i];
      final row = i + 2;
      sheet.getRangeByIndex(row, 1).setText(record.member);
      sheet.getRangeByIndex(row, 2).setText(record.insuranceID);
      sheet.getRangeByIndex(row, 3).setText(record.branch);
      sheet.getRangeByIndex(row, 4).setText(record.bankAccount);
      sheet.getRangeByIndex(row, 5).setText(record.category);
      sheet.getRangeByIndex(row, 6).setText(record.beyondDeletionDate);
      sheet.getRangeByIndex(row, 7).setText(record.memberStatus ?? '');
      sheet.getRangeByIndex(row, 8).setText(record.deletionDate);
      sheet.getRangeByIndex(row, 9).setText(record.insuranceCardName);
      sheet.getRangeByIndex(row, 10).setText(record.plan);
      sheet.getRangeByIndex(row, 11).setText(record.principleInsuranceId);
      sheet.getRangeByIndex(row, 12).setText(record.startDate);
      sheet.getRangeByIndex(row, 13).setText(record.endDate);
      sheet.getRangeByIndex(row, 14).setText(record.relation);
      sheet.getRangeByIndex(row, 15).setText(record.staff);
      sheet.getRangeByIndex(row, 16).setText(record.reactivationDate);
    }
  }

  void _setupUtiHeaders(Worksheet sheet) {
    sheet.getRangeByIndex(1, 1).setText('Uti Name');
    sheet.getRangeByIndex(1, 2).setText('Uti Value');
  }

  void _populateUtiData(Worksheet sheet, List<Result> data) {
    for (int i = 0; i < data.length; i++) {
      sheet.getRangeByIndex(i + 2, 1).setText(data[i].member);
      sheet.getRangeByIndex(i + 2, 2).setText(data[i].value);
    }
  }

  /// Create Reimbursement Excel file
  Future<FileOperationResult> createReimbursementExcel({
    required List<ReimbursementModel> reimbursementList,
  }) async {
    if (reimbursementList.isEmpty) {
      return FileOperationResult.failure('No data to export');
    }

    try {
      final Workbook workbook = Workbook();
      final Worksheet sheet = workbook.worksheets[0];

      final headers = [
        'Member Name',
        'Staff ID',
        'ID Number',
        'Mobile Number',
        'Service Type',
        'Service Date',
        'Claimed Amount',
        'Approved Amount',
        'Claim Status',
        'Payment State',
        'Batch No',
        'Breakdown Reason',
        'Missing Documents',
        'Line Name',
      ];

      for (int c = 0; c < headers.length; c++) {
        sheet.getRangeByIndex(1, c + 1).setText(headers[c]);
      }

      for (int i = 0; i < reimbursementList.length; i++) {
        final r = reimbursementList[i];
        final rowData = [
          r.memberName ?? 'N/A',
          r.staffId ?? 'N/A',
          r.idNumber ?? 'N/A',
          r.mobileNumber ?? 'N/A',
          r.serviceType ?? 'N/A',
          r.serviceDate ?? 'N/A',
          r.claimedAmount ?? 'N/A',
          r.approvedAmount ?? 'N/A',
          r.claimStatus ?? 'N/A',
          r.paymentState ?? 'N/A',
          r.batchNo ?? 'N/A',
          r.breakdownReason ?? 'N/A',
          r.missingDocs ?? 'N/A',
          r.lineName ?? 'N/A',
        ];

        for (int c = 0; c < rowData.length; c++) {
          sheet.getRangeByIndex(i + 2, c + 1).setText(rowData[c]);
        }
      }

      final List<int> bytes = workbook.saveAsStream();
      workbook.dispose();

      final filePath = await _saveFile(bytes, 'ReimbursementList.xlsx');
      await _openFile(filePath);

      return FileOperationResult.success(filePath);
    } catch (e) {
      return FileOperationResult.failure('Error creating Excel: $e');
    }
  }

  /// Download file from URL and open it
  Future<FileOperationResult> downloadAndOpenFile({
    required String url,
    required String name,
  }) async {
    if (url.isEmpty) {
      return FileOperationResult.failure('URL is empty');
    }

    try {
      final path = await _getSaveDirectory();
      final filePath = '$path/$name';

      final Dio dio = Dio();
      final response = await dio.download(url, filePath);

      if (response.statusCode == 200) {
        await _openFile(filePath);
        return FileOperationResult.success(filePath);
      } else {
        return FileOperationResult.failure(
          'Download failed with status: ${response.statusCode}',
        );
      }
    } catch (e) {
      return FileOperationResult.failure('Download error: $e');
    }
  }

  /// Share Excel file directly (useful when open doesn't work)
  Future<void> shareExcelFile(String filePath) async {
    await _shareFile(filePath);
  }
}
