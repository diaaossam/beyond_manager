import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/other_line/data/models/crm_lead_response.dart';
import 'package:bond/features/other_line/data/models/crm_lead_response.dart';
import 'package:bond/widgets/main_widget/app_text.dart';
import 'package:bond/widgets/main_widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/app_localizations_extension.dart';
import '../../../../core/utils/app_size.dart';
import '../../data/models/recommended_model.dart';

class SuccessCreateCrmDialog extends StatelessWidget {
  final CrmLeadResponse product;

  const SuccessCreateCrmDialog({super.key, required this.product});

  static Future<void> show(
    BuildContext context, {
    required CrmLeadResponse product,
  }) {
    return showDialog(
      context: context,
      builder: (context) => SuccessCreateCrmDialog(product: product),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.screenWidth * .04),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: SizeConfig.bodyHeight * .02),
            Icon(
              Icons.check_circle,
              size: 60,
              color: context.colorScheme.tertiary,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .02),
            AppText.title(
              text: product.message ?? "",
              maxLines: 3,
              align: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.bodyHeight * .04),
            _buildRowInfo(
              context,
              context.localizations.leadReference,
              product.leadRef ?? "",
            ),
            SizedBox(height: SizeConfig.bodyHeight * .01),
            _buildRowInfo(
              context,
              context.localizations.companyName,
              product.companyName ?? "",
            ),
            SizedBox(height: SizeConfig.bodyHeight * .01),
            _buildRowInfo(
              context,
              context.localizations.insuranceLine,
              product.insuranceLineName ?? "",
            ),
            SizedBox(height: SizeConfig.bodyHeight * .01),
            _buildRowInfo(
              context,
              context.localizations.matchLevel,
              product.matchLevelDisplay ?? "",
            ),
            SizedBox(height: SizeConfig.bodyHeight * .01),
            SizedBox(height: 20),
            CustomButton(
              text: context.localizations.close,
              backgroundColor: context.colorScheme.tertiary,
              iconData: Icons.arrow_forward,
              press: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowInfo(BuildContext context, String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppText.body(
            text: "${title} :",
            fontWeight: FontWeight.w500,
            color: context.colorScheme.shadow,
          ),
        ),
        AppText.body(
          text: value,
          fontWeight: FontWeight.w600,
          color: context.colorScheme.tertiary,
        ),
      ],
    );
  }
}
