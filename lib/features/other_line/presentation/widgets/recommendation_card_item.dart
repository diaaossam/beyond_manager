import 'package:bond/features/other_line/data/models/recommended_model.dart';
import 'package:bond/features/other_line/presentation/widgets/product_benefits_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/extensions/color_extensions.dart';
import '../../../../core/utils/app_size.dart';
import '../../../../widgets/main_widget/app_text.dart';

class RecommendationCardItem extends StatelessWidget {
  final RecommendedModel model;
  final VoidCallback? onGetQuote;

  const RecommendationCardItem({
    super.key,
    required this.model,
    this.onGetQuote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .015),
      padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.onSurface.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () => ProductBenefitsDialog.show(
          context,
          product: model,
          onGetQuote: onGetQuote,
        ),
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primaryContainer.withValues(
                      alpha: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.shield_outlined,
                    size: 24,
                    color: context.colorScheme.primary,
                  ),
                ),
                SizedBox(width: SizeConfig.screenWidth * .01),
                Expanded(
                  child: AppText(
                    text: model.name ?? "",
                    fontWeight: FontWeight.w700,
                    textSize: 12,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: model.matchColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: AppText(
                    text: model.matchLevelDisplay ?? "",
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .008),
            Padding(
              padding: EdgeInsets.only(
                left: SizeConfig.screenWidth * .03 + 24 + 12,
              ),
              child: Row(
                children: [
                  Spacer(),
                  AppText(
                    text: context.localizations.showProductBenefits,
                    textSize: 9,
                    fontWeight: FontWeight.w600,
                    color: context.colorScheme.shadow,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
