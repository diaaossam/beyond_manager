import 'package:beymanger/config/helper/locale_helper/app_localizations_extension.dart';
import 'package:beymanger/core/utils/app_size.dart';
import 'package:beymanger/features/policies/data/models/active_list_policy_model.dart';
import 'package:beymanger/widgets/app_text.dart';
import 'package:flutter/material.dart';

class CustomActiveHeaderExpanded extends StatelessWidget {
  final ActiveListResult result;
  final bool isBusinessLife;

  const CustomActiveHeaderExpanded(
      {super.key, required this.result, required this.isBusinessLife});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          // vertical: SizeConfig.bodyHeight * .01,
          horizontal: SizeConfig.bodyHeight * .02),
      decoration: BoxDecoration(
        color: const Color(0xffFEFAF8),
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
              textSize: 18),
          SizedBox(height: SizeConfig.bodyHeight * .01),
          AppText(
              text:
                  "${isBusinessLife ? context.localizations.staffId : context.localizations.insuranceID} ${isBusinessLife ? ":" : "-"} ${isBusinessLife ? result.staff ?? "" : result.insuranceID ?? ""}"),
          SizedBox(height: SizeConfig.bodyHeight * .02),
        ],
      ),
    );
  }
}
