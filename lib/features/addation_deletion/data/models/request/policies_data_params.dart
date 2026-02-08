class PoliciesDataParams {
  final int pageKey;

  PoliciesDataParams({this.pageKey = 1});

  Map<String, dynamic> toJson() {
    return {"page": pageKey};
  }
}
