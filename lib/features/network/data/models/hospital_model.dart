class HospitalModel {
  HospitalModel({
      this.address, 
      this.area, 
      this.city, 
      this.email, 
      this.fax, 
      this.hasChronicMedication, 
      this.isOnline, 
      this.latitude, 
      this.longitude, 
      this.phoneNumber, 
      this.provider, 
      this.providerType, 
      this.specialty, 
      this.subSpeciality, 
      this.websiteUrl,});

  HospitalModel.fromJson(dynamic json) {
    address = json['address'];
    area = json['area'];
    city = json['city'];
    email = json['email'];
    fax = json['fax'];
    hasChronicMedication = json['hasChronicMedication'];
    isOnline = json['isOnline'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phoneNumber = json['phone_number'];
    provider = json['provider'];
    providerType = json['provider_type'];
    specialty = json['specialty'];
    subSpeciality = json['subSpeciality'];
    websiteUrl = json['websiteUrl'];
  }
  String? address;
  String? area;
  String? city;
  String? email;
  String? fax;
  String? hasChronicMedication;
  String? isOnline;
  String? latitude;
  String? longitude;
  String? phoneNumber;
  String? provider;
  String? providerType;
  String? specialty;
  String? subSpeciality;
  String? websiteUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['area'] = area;
    map['city'] = city;
    map['email'] = email;
    map['fax'] = fax;
    map['hasChronicMedication'] = hasChronicMedication;
    map['isOnline'] = isOnline;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['phone_number'] = phoneNumber;
    map['provider'] = provider;
    map['provider_type'] = providerType;
    map['specialty'] = specialty;
    map['subSpeciality'] = subSpeciality;
    map['websiteUrl'] = websiteUrl;
    return map;
  }

}