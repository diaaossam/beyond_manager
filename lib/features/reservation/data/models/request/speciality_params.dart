class SpecialityParams {
  final List<num> specialityIds;

  SpecialityParams({
    required this.specialityIds,
  });

  Map<String, dynamic> toJson() {
    return {
      'idBranch': specialityIds,
    };
  }
}
