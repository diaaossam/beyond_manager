import 'dart:io';

class InsuranceData {
  final List<File> files;
  final String? excelPath;

  InsuranceData({
    this.files = const [],
    this.excelPath,
  });

  InsuranceData copyWith({
    List<File>? files,
    String? excelPath,
  }) {
    return InsuranceData(
      files: files ?? this.files,
      excelPath: excelPath ?? this.excelPath,
    );
  }
}
