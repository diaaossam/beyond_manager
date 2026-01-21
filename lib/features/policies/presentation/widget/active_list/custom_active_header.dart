import 'package:bond/core/extensions/color_extensions.dart';
import 'package:bond/features/policies/data/models/response/active_list_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';

class CustomActiveHeaderExpanded extends StatelessWidget {
  final Result result;
  final bool isBusinessLife;

  const CustomActiveHeaderExpanded({
    super.key,
    required this.result,
    required this.isBusinessLife,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.bodyHeight * .02),
      decoration: BoxDecoration(
        color: context.colorScheme.onPrimary,
        // border: Border.all(color: const Color(0xffEAEAEA)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.bodyHeight * .02),
          AppText(
            text: result.member ?? "",
            fontWeight: FontWeight.bold,
            textSize: 18,
          ),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          AppText(
            text:
                "${isBusinessLife ? context.localizations.staffId : context.localizations.insuranceID} ${isBusinessLife ? ":" : "-"} ${isBusinessLife ? result.staff ?? "" : result.insuranceID ?? ""}",
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
        ],
      ),
    );
  }
}
