import 'hospital_model.dart';

class PaginationModel {
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final int totalRecords;
  final List<HospitalModel> data;

  const PaginationModel({
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.totalRecords,
    required this.data,
  });

  factory PaginationModel.fromJson({required Map<String, dynamic> json}) {
    final pagination = json['pagination'] as Map<String, dynamic>?;
    final result = json['result'] as List<dynamic>?;

    return PaginationModel(
      pageNumber: pagination?['page_number'] ?? 0,
      pageSize: pagination?['page_size'] ?? 0,
      totalPages: pagination?['total_pages'] ?? 0,
      totalRecords: pagination?['total_records'] ?? 0,
      data: HospitalModel.fromJsonList(result),
    );
  }

  bool get hasMore => pageNumber < totalPages;

  PaginationModel copyWith({
    int? pageNumber,
    int? pageSize,
    int? totalPages,
    int? totalRecords,
    List<HospitalModel>? data,
  }) {
    return PaginationModel(
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      totalPages: totalPages ?? this.totalPages,
      totalRecords: totalRecords ?? this.totalRecords,
      data: data ?? this.data,
    );
  }
}
