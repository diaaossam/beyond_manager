import 'package:bond/features/other_line/data/models/recommended_model.dart';

import '../../data/models/template_model.dart';

class OtherLineStateData {
  final List<TemplateModel>? templates;
  final RecommendedModel? recommendedModel;

  OtherLineStateData({this.templates, this.recommendedModel});

  OtherLineStateData copyWith({
    List<TemplateModel>? templates,
    RecommendedModel? recommendedModel,
  }) {
    return OtherLineStateData(
      templates: templates ?? this.templates,
      recommendedModel: recommendedModel ?? this.recommendedModel,
    );
  }
}
