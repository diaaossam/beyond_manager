class BranchesResponse {
  final Map<String, List<AddationBranchModel>> result;

  BranchesResponse({required this.result});

  factory BranchesResponse.fromJson(Map<String, dynamic> json) {
    final raw = json['result'] as Map<String, dynamic>;

    return BranchesResponse(
      result: raw.map((key, value) {
        final list = (value as List)
            .map((e) => AddationBranchModel.fromJson(e))
            .toList();
        return MapEntry(key, list);
      }),
    );
  }
}

class AddationBranchModel {
  final int branchId;
  final String branchName;

  AddationBranchModel({required this.branchId, required this.branchName});

  factory AddationBranchModel.fromJson(Map<String, dynamic> json) {
    return AddationBranchModel(
      branchId: json['branch_id'],
      branchName: json['branch_name'],
    );
  }
}
