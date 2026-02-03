enum InsurancePlanEnum { basic, premium, standard }

extension InsurancePlanEnumExtension on InsurancePlanEnum {
  String get name {
    switch (this) {
      case InsurancePlanEnum.basic:
        return 'Basic';
      case InsurancePlanEnum.premium:
        return 'Premium';
      case InsurancePlanEnum.standard:
        return 'Standard';
    }
  }
}
