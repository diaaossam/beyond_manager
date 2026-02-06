enum NationalityEnum {
  egyptian("Egyptian"),
  nonEgyptian("Non-Egyptian");

  final String name;

  const NationalityEnum(this.name);
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
