import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/utilization_model.dart';

class CustomUtilizationCardExpanded extends StatelessWidget {
  final Utilization result;

  const CustomUtilizationCardExpanded({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.bodyHeight * .03,
        horizontal: SizeConfig.bodyHeight * .02,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffFEFAF8),
        border: Border.all(color: const Color(0xffEAEAEA)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "${context.localizations.utilizationClaimHistory} : ${result.name.toString()}",
            fontWeight: FontWeight.bold,
            maxLines: 2,
            textSize: 14,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          AppText(text: "${context.localizations.value}: ${result.value.toString()}"),
        ],
      ),
    );
  }
}
