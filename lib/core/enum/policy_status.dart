import '../../generated/l10n.dart';

enum PolicyStatus {
  all("All"),
  active("Active Policy"),
  expired("Expired"),
  suspended("Suspended"),
  terminatedWithInsuranceCompany("Terminated With Insurance Company"),
  underIssuance("Under Issuance"),
  draft("Draft"),
  terminatedWithBeyond("Terminated With Beyond"),
  lapsedBupa("Lapsed Bupa"),
  cancel("Cancel");

  final String name;

  const PolicyStatus(this.name);
}
extension PolicyStatusX on PolicyStatus {
  String get label {
    switch (this) {
      case PolicyStatus.all:
        return S.current.policy_status_all;
      case PolicyStatus.active:
        return S.current.policy_status_active;
      case PolicyStatus.expired:
        return S.current.policy_status_expired;
      case PolicyStatus.suspended:
        return S.current.policy_status_suspended;
      case PolicyStatus.terminatedWithInsuranceCompany:
        return S.current.policy_status_terminated_with_insurance_company;
      case PolicyStatus.underIssuance:
        return S.current.policy_status_under_issuance;
      case PolicyStatus.draft:
        return S.current.policy_status_draft;
      case PolicyStatus.terminatedWithBeyond:
        return S.current.policy_status_terminated_with_beyond;
      case PolicyStatus.lapsedBupa:
        return S.current.policy_status_lapsed_bupa;
      case PolicyStatus.cancel:
        return S.current.policy_status_cancel;
    }
  }
}
