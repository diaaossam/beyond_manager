enum MaritalStatusEnum {
  single("single"),
  married("married");

  final String name;

  const MaritalStatusEnum(this.name);
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
