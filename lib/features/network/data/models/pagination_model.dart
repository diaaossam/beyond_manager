import 'package:bond/features/network/data/models/hospital_model.dart';

class PaginationModel {
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final int totalRecords;
  final List<HospitalModel> data;

  PaginationModel(
      {required this.pageNumber,
      required this.pageSize,
      required this.totalPages,
      required this.totalRecords,
      required this.data});

  factory PaginationModel.fromJson({required Map<String, dynamic> json}) {
    List<HospitalModel> hospitalList = [];
    if (json['result'] != null) {
      json['result'].forEach((element) {
        HospitalModel hospitalModel = HospitalModel.fromJson(element);
        hospitalList.add(hospitalModel);
      });
    }
    return PaginationModel(
        pageNumber:
            json["pagination"] != null ? json["pagination"]['page_number'] : 0,
        pageSize:
            json["pagination"] != null ? json["pagination"]['page_size'] : 0,
        totalPages:
            json["pagination"] != null ? json["pagination"]['total_pages'] : 0,
        totalRecords: json["pagination"] != null
            ? json["pagination"]['total_records']
            : 0,
        data: hospitalList);
  }
}
