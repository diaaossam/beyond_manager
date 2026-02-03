enum MaritalStatusEnum {
  single,
  married;

  String toArabic() {
    switch (this) {
      case MaritalStatusEnum.single:
        return "أعزب";
      case MaritalStatusEnum.married:
        return "متزوج";
    }
  }
}

MaritalStatusEnum? maritalStatusFromString(String? value) {
  if (value == null) return null;
  switch (value.toLowerCase()) {
    case 'single':
      return MaritalStatusEnum.single;
    case 'married':
      return MaritalStatusEnum.married;
    default:
      return null;
  }
}
