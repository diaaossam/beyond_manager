import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/other_line/data/models/recommended_model.dart';

class RecommendedMainModel {
  RecommendedMainModel({
    this.filteredCount,
    this.industry,
    this.recommendations,
    this.totalCount,
  });

  RecommendedMainModel.fromJson(dynamic json) {
    filteredCount = json['filtered_count'];
    industry = json['industry'] != null
        ? GenericModel.fromJsonName(json['industry'])
        : null;
    if (json['recommendations'] != null) {
      recommendations = [];
      json['recommendations'].forEach((v) {
        recommendations?.add(RecommendedModel.fromJson(v));
      });
    }
    totalCount = json['total_count'];
  }

  num? filteredCount;
  GenericModel? industry;
  List<RecommendedModel>? recommendations;
  num? totalCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['filtered_count'] = filteredCount;
    if (industry != null) {
      map['industry'] = industry?.toJson();
    }
    if (recommendations != null) {
      map['recommendations'] = recommendations?.map((v) => v.toJson()).toList();
    }
    map['total_count'] = totalCount;
    return map;
  }
}
