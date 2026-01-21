import 'package:flutter/material.dart';

import '../../../../../core/extensions/app_localizations_extension.dart';
import '../../../../../core/utils/app_size.dart';
import '../../../../../widgets/main_widget/app_text.dart';
import '../../../data/models/response/policy_details.dart';

class PolicyInfoPlanSection extends StatelessWidget {
  final PolicyDetails policyDetails;

  const PolicyInfoPlanSection({
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
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfffefaf8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: SizeConfig.bodyHeight * .02),
          Row(
            children: [
              AppText(
                text: "${context.localizations.paymentPlan}: ",
                textSize: 12,
              ),
              AppText(
                text: policyDetails.paymentPlan ?? "",
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(height: SizeConfig.bodyHeight * .02),
        ],
      ),
    );
  }
}
