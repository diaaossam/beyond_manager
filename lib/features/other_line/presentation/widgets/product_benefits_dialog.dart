import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../data/models/recommended_product_model.dart';

class ProductBenefitsDialog extends StatelessWidget {
  final RecommendedProductModel product;
  final VoidCallback? onGetQuote;

  const ProductBenefitsDialog({
    super.key,
    required this.product,
    this.onGetQuote,
  });

  static Future<void> show(
    BuildContext context, {
    required RecommendedProductModel product,
    VoidCallback? onGetQuote,
  }) {
    return showDialog(
      context: context,
      builder: (context) => ProductBenefitsDialog(
        product: product,
        onGetQuote: () {
          Navigator.of(context).pop();
          onGetQuote?.call();
        },
      ),
    );
  }

  Color _matchColor(BuildContext context) {
    switch (product.matchLevel) {
      case MatchLevel.high:
        return const Color(0xFFE85D04);
      case MatchLevel.medium:
        return const Color(0xFF16A34A);
      case MatchLevel.low:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final matchColor = _matchColor(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.screenWidth * .05),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colorScheme.primaryContainer.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.shield_outlined,
                    size: 28,
                    color: context.colorScheme.primary,
                  ),
                ),
                SizedBox(width: SizeConfig.screenWidth * .03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: product.name,
                        fontWeight: FontWeight.w700,
                        textSize: 16,
                        color: context.colorScheme.onSurface,
                      ),
                      SizedBox(height: SizeConfig.bodyHeight * .005),
                      AppText(
                        text: "(${product.matchLabel} Match)",
                        textSize: 13,
                        color: matchColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 20,
                  color: context.colorScheme.primary,
                ),
                SizedBox(width: SizeConfig.screenWidth * .02),
                Expanded(
                  child: AppText(
                    text: product.description,
                    textSize: 13,
                    color: context.colorScheme.onSurface,
                    maxLines: 6,
                  ),
                ),
              ],
            ),
            SizedBox(height: SizeConfig.bodyHeight * .025),
            CustomButton(
              text: context.localizations.getPersonalizedQuote,
              iconData: Icons.arrow_forward,
              press: () {
                Navigator.of(context).pop();
                onGetQuote?.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
