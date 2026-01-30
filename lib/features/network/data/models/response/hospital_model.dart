class HospitalResponseModel {
  final int pageNumber;
  final int pageSize;
  final int totalPages;
  final int totalRecords;
  final List<HospitalModel> data;

  const HospitalResponseModel({
    required this.pageNumber,
    required this.pageSize,
    required this.totalPages,
    required this.totalRecords,
    required this.data,
  });

  factory HospitalResponseModel.fromJson({required Map<String, dynamic> json}) {
    final pagination = json['pagination'] as Map<String, dynamic>?;
    final result = json['result'] as List<dynamic>?;

    return HospitalResponseModel(
      pageNumber: pagination?['page_number'] ?? 0,
      pageSize: pagination?['page_size'] ?? 0,
      totalPages: pagination?['total_pages'] ?? 0,
      totalRecords: pagination?['total_records'] ?? 0,
      data: HospitalModel.fromJsonList(result),
    );
  }

  bool get hasMore => pageNumber < totalPages;

  HospitalResponseModel copyWith({
    int? pageNumber,
    int? pageSize,
    int? totalPages,
    int? totalRecords,
    List<HospitalModel>? data,
  }) {
    return HospitalResponseModel(
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      totalPages: totalPages ?? this.totalPages,
      totalRecords: totalRecords ?? this.totalRecords,
      data: data ?? this.data,
    );
  }
}

class HospitalModel {
  final String? address;
  final String? area;
  final String? city;
  final String? email;
  final String? fax;
  final String? hasChronicMedication;
  final String? isOnline;
  final String? latitude;
  final String? longitude;
  final String? phoneNumber;
  final String? provider;
  final String? providerType;
  final String? specialty;
  final String? subSpeciality;
  final String? websiteUrl;

  const HospitalModel({
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
    this.websiteUrl,
  });

  factory HospitalModel.fromJson(dynamic json) {
    return HospitalModel(
      address: json['address'],
      area: json['area'],
      city: json['city'],
      email: json['email'],
      fax: json['fax'],
      hasChronicMedication: json['hasChronicMedication'],
      isOnline: json['isOnline'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      phoneNumber: json['phone_number'],
      provider: json['provider'],
      providerType: json['provider_type'],
      specialty: json['specialty'],
      subSpeciality: json['subSpeciality'],
      websiteUrl: json['websiteUrl'],
    );
  }

  static List<HospitalModel> fromJsonList(dynamic json) {
    if (json is List) {
      return json.map<HospitalModel>((e) => HospitalModel.fromJson(e)).toList();
    }
    return [];
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'area': area,
      'city': city,
      'email': email,
      'fax': fax,
      'hasChronicMedication': hasChronicMedication,
      'isOnline': isOnline,
      'latitude': latitude,
      'longitude': longitude,
      'phone_number': phoneNumber,
      'provider': provider,
      'provider_type': providerType,
      'specialty': specialty,
      'subSpeciality': subSpeciality,
      'websiteUrl': websiteUrl,
    };
  }
}
