class SearchParamsModel {
  final String? tpa;
  final String? company;
  final String? provider;
  final String? tiers;
  final List<String>? city;
  final List<String>? area;
  final List<String>? providerType;
  final List<String>? speciality;
  final int pageNumber;

  SearchParamsModel(
      {this.tpa,
      this.company,
      this.provider,
      this.pageNumber = 1,
      this.tiers,
      this.city,
      this.area,
      this.providerType,
      this.speciality});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "tpa": tpa,
      "company": company,
      "city": city?.isNotEmpty == true ? city?.join(","): null, // دمج city لو مش فاضية
      "page_number": pageNumber,
      "tier_rank": tiers,
      "specialty": speciality?.isNotEmpty == true ? speciality?.join(","): null,
      "provider_type": providerType?.isNotEmpty == true ? providerType?.join(","): null,
      "area": area?.isNotEmpty == true ? area?.join(","): null,
      "provider": provider,
    }..removeWhere((key, value) => value == null || (value is List && value.isEmpty));

    return map;
  }
  SearchParamsModel copyWith({
    String? tpa,
    String? company,
    String? provider,
    String? tiers,
    List<String>? city,
    List<String>? area,
    List<String>? providerType,
    List<String>? speciality,
    int? pageNumber,
  }) {
    return SearchParamsModel(
      tpa: tpa ?? this.tpa,
      company: company ?? this.company,
      provider: provider ?? this.provider,
      tiers: tiers ?? this.tiers,
      city: city ?? this.city,
      area: area ?? this.area,
      providerType: providerType ?? this.providerType,
      speciality: speciality ?? this.speciality,
      pageNumber: pageNumber ?? this.pageNumber,
    );
  }
}
