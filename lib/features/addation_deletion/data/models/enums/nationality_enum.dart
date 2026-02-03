enum NationalityEnum {
  egyptian,
  nonEgyptian;

  String toArabic() {
    switch (this) {
      case NationalityEnum.egyptian:
        return "مصري";
      case NationalityEnum.nonEgyptian:
        return "غير مصري";
    }
  }
}

NationalityEnum? nationalityFromString(String? value) {
  if (value == null) return null;
  switch (value.toLowerCase()) {
    case 'egyptian':
      return NationalityEnum.egyptian;
    case 'non-egyptian':
    case 'nonegyptian':
      return NationalityEnum.nonEgyptian;
    default:
      return null;
  }
}
