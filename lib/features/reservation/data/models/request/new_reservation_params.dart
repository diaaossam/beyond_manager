class NewReservationParams {
  final List<num> idBranch;
  final num codeSpecialite;
  final String? gender;
  final String? partOfDay;

  NewReservationParams(
      {required this.idBranch,
      required this.codeSpecialite,
      required this.gender,
      required this.partOfDay});
}
