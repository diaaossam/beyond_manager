import 'package:bond/core/extensions/app_localizations_extension.dart';
import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/policies/data/models/response/active_list_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class CustomActiveMemberCardExpanded extends StatelessWidget {
  final Result result;

  const CustomActiveMemberCardExpanded({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.bodyHeight * .03,
        horizontal: SizeConfig.bodyHeight * .02,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        border: Border.all(color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            text: "${context.localizations.item} : ${result.name.toString()}",
            fontWeight: FontWeight.bold,
            maxLines: 2,
            textSize: 14,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          AppText(text: "${context.localizations.description}: ${result.value.toString()}"),
        ],
      ),
    );
  }
}
