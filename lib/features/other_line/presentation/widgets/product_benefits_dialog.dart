import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../data/models/recommended_model.dart';

class ProductBenefitsDialog extends StatelessWidget {
  final RecommendedModel product;
  final VoidCallback? onGetQuote;

  const ProductBenefitsDialog({
    super.key,
    required this.product,
    this.onGetQuote,
  });

  static Future<void> show(
    BuildContext context, {
    required RecommendedModel product,
    VoidCallback? onGetQuote,
  }) {
    return showDialog(
      context: context,
      builder: (context) => ProductBenefitsDialog(
        product: product,
        onGetQuote: () => onGetQuote?.call(),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.screenWidth * .02),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    size: 28,
                    color: context.colorScheme.primary,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: product.name??"",
                        fontWeight: FontWeight.w700,
                        textSize: 14,
                        color: context.colorScheme.onSurface,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .005),
                      AppText(
                        text: "(${product.matchLevelDisplay})",
                        textSize: 12,
                        color: product.matchColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            if (product.benefits != null && product.benefits!.isNotEmpty)
              ...product.benefits!.map(
                (benefit) => Padding(
                  padding: EdgeInsets.only(bottom: SizeConfig.bodyHeight * .01),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 20,
                        color: context.colorScheme.primary,
                      ),
                      SizedBox(width: SizeConfig.screenWidth * .02),
                      Expanded(
                        child: AppText.hint(
                          text: benefit.name ?? "",
                          textSize: 11,
                          maxLines: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: 20,),
            CustomButton(
              text: context.localizations.getPersonalizedQuote,
              iconData: Icons.arrow_forward,
              press: () {
                Navigator.pop(context);
                onGetQuote?.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
