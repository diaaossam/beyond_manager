enum InsurancePlanEnum {
  premium,
  standard;

  String toArabic() {
    switch (this) {
      case InsurancePlanEnum.premium:
        return "خطة مميزة";
      case InsurancePlanEnum.standard:
        return "خطة قياسية";
    }
  }
}

InsurancePlanEnum? insurancePlanFromString(String? value) {
  if (value == null) return null;
  switch (value.toLowerCase()) {
    case 'premium':
    case 'premium plan':
      return InsurancePlanEnum.premium;
    case 'standard':
    case 'standard plan':
      return InsurancePlanEnum.standard;
    default:
      return null;
  }
}
