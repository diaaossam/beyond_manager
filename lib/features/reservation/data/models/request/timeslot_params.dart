class DoctorBookingParams {
  final String? startDate;
  final String? endDate;
  final List<num>? idBranch;
  final num? codeSpecialite;
  final String? gender;
  final String? partOfDay;

  DoctorBookingParams(
      {this.idBranch,
      this.codeSpecialite,
      this.gender,
      this.partOfDay,
      this.endDate,
      this.startDate});

  DoctorBookingParams copyWith({
    List<num>? idBranch,
    num? codeSpecialite,
    String? gender,
    String? partOfDay,
    String? startDate,
    String? endDate,
  }) {
    return DoctorBookingParams(
        idBranch: idBranch ?? this.idBranch,
        codeSpecialite: codeSpecialite ?? this.codeSpecialite,
        gender: gender ?? this.gender,
        partOfDay: partOfDay ?? this.partOfDay,
        endDate: endDate ?? this.endDate,
        startDate: startDate ?? this.startDate);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "idBranch": idBranch.toString().replaceAll("]", "").replaceAll("[", ""),
      "codeSpecialite": codeSpecialite,
      "gender": gender,
      "partOfDay": partOfDay ?? "",
      "start_date": startDate,
      "end_date": endDate,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
