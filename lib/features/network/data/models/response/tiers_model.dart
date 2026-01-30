class TiersModel {
  TiersModel({
    this.areas,
    this.cities,
    this.providerTypes,
    this.specialties,
    this.tiers,
  });

  TiersModel.fromJson(dynamic json) {
    if (json['areas'] != null) {
      areas = [];
      json['areas'].forEach((v) {
        areas?.add(MainTiersModel.fromJson(v));
      });
    }
    if (json['cities'] != null) {
      cities = [];
      json['cities'].forEach((v) {
        cities?.add(MainTiersModel.fromJson(v));
      });
    }
    if (json['provider_types'] != null) {
      providerTypes = [];
      json['provider_types'].forEach((v) {
        providerTypes?.add(MainTiersModel.fromJson(v));
      });
    }
    if (json['specialties'] != null) {
      specialties = [];
      json['specialties'].forEach((v) {
        specialties?.add(MainTiersModel.fromJson(v));
      });
    }
    if (json['tiers'] != null) {
      tiers = [];
      json['tiers'].forEach((v) {
        tiers?.add(Tiers.fromJson(v));
      });
    }
  }

  List<MainTiersModel>? areas;
  List<MainTiersModel>? cities;
  List<MainTiersModel>? providerTypes;
  List<MainTiersModel>? specialties;
  List<Tiers>? tiers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (areas != null) {
      map['areas'] = areas?.map((v) => v.toJson()).toList();
    }
    if (cities != null) {
      map['cities'] = cities?.map((v) => v.toJson()).toList();
    }
    if (providerTypes != null) {
      map['provider_types'] = providerTypes?.map((v) => v.toJson()).toList();
    }
    if (specialties != null) {
      map['specialties'] = specialties?.map((v) => v.toJson()).toList();
    }
    if (tiers != null) {
      map['tiers'] = tiers?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Tiers {
  Tiers({
    this.key,
    this.value,
  });

  Tiers.fromJson(dynamic json) {
    key = json['key'];
    value = json['value'];
  }

  String? key;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['key'] = key;
    map['value'] = value;
    return map;
  }
}

class MainTiersModel {
  MainTiersModel({
    this.areaId,
    this.cityId,
    this.id,
    this.name,
    this.providerTypeId,
    this.concatenatedValue,
  });

  MainTiersModel.fromJson(dynamic json) {
    areaId = json['area_id'];
    cityId = json['city_id'];
    id = json['id'];
    name = json['name'];
    concatenatedValue = json['concatenated_value'];
    providerTypeId = json['provider_type_id'];
  }

  num? areaId;
  num? cityId;
  num? id;
  String? name;
  String? concatenatedValue;
  num? providerTypeId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['area_id'] = areaId;
    map['city_id'] = cityId;
    map['concatenated_value'] = concatenatedValue;
    map['id'] = id;
    map['name'] = name;
    map['provider_type_id'] = providerTypeId;
    return map;
  }
}
