enum GenderEnum {
  male("M"),
  female("F");

  final String name;

  const GenderEnum(this.name);
}

GenderEnum? handleToGender({String? gender}) {
  if (gender == "M") {
    return GenderEnum.male;
  }
  if (gender == "F") {
    return GenderEnum.female;
  }
  return null;
}
