import 'package:bond/features/addation_deletion/data/models/response/policies_data_addation.dart';

class AddationHelper {
  /// Merges the boolean permission fields across all selected policies.
  ///
  /// Logic per field:
  /// - If ANY policy has it as `true` (or `null` = not present) → `true` (required & visible)
  /// - Only if ALL policies have it as `false` → `false` (hidden)
  ///
  /// Fields that don't exist in [PoliciesDataModel] are always required by default.
 static PoliciesDataModel getPoliciesDataPermission({
    required List<PoliciesDataModel> list,
  }) {
    if (list.isEmpty) return PoliciesDataModel();
    return PoliciesDataModel(
      reqArabicName: list.any((p) => p.reqArabicName != false),
      reqEmail: list.any((p) => p.reqEmail != false),
      reqPhoto: list.any((p) => p.reqPhoto != false),
      reqAcknowledgement: list.any((p) => p.reqAcknowledgement != false),
      reqHiringDate: list.any((p) => p.reqHiringDate != false),
      reqNationality: list.any((p) => p.reqNationality != false),
      isIbanInAdditionRequired: list.any((p) => p.isIbanInAdditionRequired != false),
      isSalaryInAdditionRequired: list.any((p) => p.isSalaryInAdditionRequired != false),
    );
  }
}