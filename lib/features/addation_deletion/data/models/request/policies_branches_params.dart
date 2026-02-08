class PoliciesBranchesParams {
  final List<num> policiesId;

  PoliciesBranchesParams({required this.policiesId});

  Map<String, dynamic> toJson() {
    return {"policies": policiesId};
  }
}
