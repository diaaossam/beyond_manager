class ServiceCenterModel {
  ServiceCenterModel({
    this.area,
    this.centerType,
    this.city,
    this.hotline,
    this.insuranceCompany,
    this.location,
    this.phone,
    this.serviceCenterName,
    this.serviceCenterNameAr,
    this.vehicleBrand,
  });

  ServiceCenterModel.fromJson(dynamic json) {
    area = json['area'];
    centerType = json['center_type'];
    city = json['city'];
    hotline = json['hotline'];
    insuranceCompany = json['insurance_company'];
    location = json['location'];
    phone = json['phone'];
    serviceCenterName = json['service_center_name'];
    serviceCenterNameAr = json['service_center_name_ar'];
    vehicleBrand = json['vehicle_brand'];
  }

  String? area;
  String? centerType;
  String? city;
  String? hotline;
  String? insuranceCompany;
  String? location;
  String? phone;
  String? serviceCenterName;
  String? serviceCenterNameAr;
  String? vehicleBrand;

  ServiceCenterModel copyWith({
    String? area,
    String? centerType,
    String? city,
    String? hotline,
    String? insuranceCompany,
    String? location,
    String? phone,
    String? serviceCenterName,
    String? serviceCenterNameAr,
    String? vehicleBrand,
  }) =>
      ServiceCenterModel(
        area: area ?? this.area,
        centerType: centerType ?? this.centerType,
        city: city ?? this.city,
        hotline: hotline ?? this.hotline,
        insuranceCompany: insuranceCompany ?? this.insuranceCompany,
        location: location ?? this.location,
        phone: phone ?? this.phone,
        serviceCenterName: serviceCenterName ?? this.serviceCenterName,
        serviceCenterNameAr: serviceCenterNameAr ?? this.serviceCenterNameAr,
        vehicleBrand: vehicleBrand ?? this.vehicleBrand,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['area'] = area;
    map['center_type'] = centerType;
    map['city'] = city;
    map['hotline'] = hotline;
    map['insurance_company'] = insuranceCompany;
    map['location'] = location;
    map['phone'] = phone;
    map['service_center_name'] = serviceCenterName;
    map['service_center_name_ar'] = serviceCenterNameAr;
    map['vehicle_brand'] = vehicleBrand;
    return map;
  }
}
