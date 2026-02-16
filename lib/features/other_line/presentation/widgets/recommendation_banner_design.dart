import 'package:auto_route/auto_route.dart';
import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/other_line/data/models/recommended_model.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/router/app_router.gr.dart';

class RecommendationBannerDesign extends StatelessWidget {
  final RecommendedModel model;

  const RecommendationBannerDesign({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.primary),
        color: context.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: context.colorScheme.primary),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AppText(
                  text: context.localizations.recommendedForYou,
                  textSize: 9,
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              10.horizontalSpace,
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AppText(
                  text: model.matchLevelDisplay??"",
                  textSize: 9,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          20.verticalSpace,
          AppText(
            text: context.localizations.recommendedForYouBody,
            maxLines: 10,
            color: context.colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
          20.verticalSpace,
          AppText(
            text: model.name ?? "",
            fontWeight: FontWeight.w600,
            textSize: 14,
          ),
          20.verticalSpace,
          CustomButton(
            text: context.localizations.showAllRecommendations,
            press: () => context.router.push(InsuranceProductsRoute()),
            height: 35.h,
          ),
        ],
      ),
    );
  }
}
