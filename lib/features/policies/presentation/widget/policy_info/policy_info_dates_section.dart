import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/policy_details.dart';

class PolicyInfoDatesSection extends StatelessWidget {
  final PolicyDetails policyDetails;

  const PolicyInfoDatesSection({
    super.key,
    required this.policyDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: SizeConfig.screenWidth * .03,
        vertical: SizeConfig.bodyHeight * .02,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffDDF3FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          AppText(
            text: "${context.localizations.startDate}: ",
            textSize: 11,
          ),
          AppText(
            text: " ${policyDetails.startDate ?? ""}",
            fontWeight: FontWeight.w600,
            textSize: 11,
          ),
          const Spacer(),
          AppText(
            text: "${context.localizations.endDate}: ",
            textSize: 11,
          ),
          AppText(
            text: " ${policyDetails.endDate ?? ""}",
            fontWeight: FontWeight.w600,
            textSize: 11,
          ),
        ],
      ),
    );
  }
}
