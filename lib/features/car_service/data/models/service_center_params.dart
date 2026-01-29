class ServiceParams {
  final String? company, brand, city, area, centerType, search;

  ServiceParams(
      {this.company,
      this.brand,
      this.city,
      this.area,
      this.centerType,
      this.search});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map = {
      "insurance_company": company,
      "vehicle_brand": brand,
      "city": city,
      "area": area,
      "center_type": centerType,
      "service_center": search,
    };
    map.removeWhere(
      (key, value) => value == null,
    );
    return map;
  }

  ServiceParams copyWith({
    String? company,
    String? brand,
    String? city,
    String? area,
    String? centerType,
    String? search,
    bool resetBrand = false,
    bool resetArea = false,
  }) {
    return ServiceParams(
      company: company ?? this.company,
      city: city ?? this.city,
      brand: resetBrand ? null : (brand ?? this.brand),
      area: resetArea ? null : (area ?? this.area),
      centerType: centerType ?? this.centerType,
      search: search ?? this.search,
    );
  }
}
