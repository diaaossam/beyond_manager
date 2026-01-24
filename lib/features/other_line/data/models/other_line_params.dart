class OtherLineParams {
  final String name;
  final String insuranceType;
  final String note;

  OtherLineParams(
      {required this.name, required this.insuranceType, required this.note});

  Map<String, dynamic> toJson() => {
        "namee": name,
        "insurance_type": insuranceType,
        "note": note,
      };
}
