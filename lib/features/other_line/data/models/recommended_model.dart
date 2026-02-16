import 'dart:ui';

import '../../../../config/theme/color_scheme.dart';

class RecommendedModel {
  RecommendedModel({
    this.benefitCount,
    this.benefits,
    this.id,
    this.industryId,
    this.industryName,
    this.insuranceLineId,
    this.insuranceLineName,
    this.matchLevel,
    this.matchLevelDisplay,
    this.name,
    this.totalMatches,
    this.matchColor
  });

  RecommendedModel.fromJson(dynamic json) {
    benefitCount = json['benefit_count'];
    if (json['benefits'] != null) {
      benefits = [];
      json['benefits'].forEach((v) {
        benefits?.add(Benefits.fromJson(v));
      });
    }
    id = json['id'];
    industryId = json['industry_id'];
    industryName = json['industry_name'];
    insuranceLineId = json['insurance_line_id'];
    insuranceLineName = json['insurance_line_name'];
    matchLevel = json['match_level'];
    matchLevelDisplay = json['match_level_display'];
    name = json['name'];
    totalMatches = json['total_matches'];
    matchColor = _matchColor;

  }

  num? benefitCount;
  List<Benefits>? benefits;
  num? id;
  num? industryId;
  String? industryName;
  num? insuranceLineId;
  String? insuranceLineName;
  String? matchLevel;
  String? matchLevelDisplay;
  String? name;
  num? totalMatches;
  Color  ? matchColor ;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['benefit_count'] = benefitCount;
    if (benefits != null) {
      map['benefits'] = benefits?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    map['industry_id'] = industryId;
    map['industry_name'] = industryName;
    map['insurance_line_id'] = insuranceLineId;
    map['insurance_line_name'] = insuranceLineName;
    map['match_level'] = matchLevel;
    map['match_level_display'] = matchLevelDisplay;
    map['name'] = name;
    map['total_matches'] = totalMatches;
    return map;
  }

  Color get _matchColor {
    if (matchLevel == "high") {
      return AppColorScheme.light.primary; // Green
    } else if (matchLevel == "medium") {
      return AppColorScheme.light.tertiary; // Amber
    } else if (matchLevel == "low") {
      return AppColorScheme.light.shadow; // Red
    } else {
      return AppColorScheme.light.shadow; // Grey for unknown match level
    }
  }
}

class Benefits {
  Benefits({this.description, this.id, this.name});

  Benefits.fromJson(dynamic json) {
    description = json['description'];
    id = json['id'];
    name = json['name'];
  }

  String? description;
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['description'] = description;
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
