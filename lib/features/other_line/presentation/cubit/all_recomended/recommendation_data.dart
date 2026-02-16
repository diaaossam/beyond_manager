import 'package:bond/features/other_line/data/models/crm_lead_response.dart';

import '../../../data/models/recommended_main_model.dart';

class RecommendationData {
  final RecommendedMainModel? recommendedMainModel;
  final CrmLeadResponse? crmLeadResponse;

  RecommendationData({this.recommendedMainModel, this.crmLeadResponse});

  RecommendationData copyWith({
    RecommendedMainModel? recommendedMainModel,
    CrmLeadResponse? crmLeadResponse,
  }) {
    return RecommendationData(
      recommendedMainModel: recommendedMainModel ?? this.recommendedMainModel,
      crmLeadResponse: crmLeadResponse ?? this.crmLeadResponse,
    );
  }
}
